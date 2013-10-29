require 'digest/sha1'

class TransactionsController < ApplicationController

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transaction_params)

    respond_to do |format|
      if @transaction.save
        @final = consume_api(transaction_params)
        format.html { render action: 'consume' }
      else
        format.html { render action: 'new' }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  def consume
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      params.require(:transaction).permit(:uid, :pub0, :page)
    end

    def get_api_connection
      conn = Faraday.new(:url => BASE_URI) do |c|
          c.use Faraday::Request::UrlEncoded  # encode request params as "www-form-urlencoded"
          c.use Faraday::Response::Logger     # log request & response to STDOUT
          c.use Faraday::Adapter::NetHttp     # perform requests with Net::HTTP
      end
    end

    def get_hashkey(params)
      initial_call_params   = build_call_params(params)
      formatted_call_params = URI.escape(initial_call_params.collect{|k,v| "#{k}=#{v}"}.join('&'))
      final_call_params     = formatted_call_params + "&#{API_KEY}"
      hashkey               = Digest::SHA1.hexdigest final_call_params
    end

    def build_call_params(params)
      call_params = {
          appid: APP_ID,
          device_id: DEVICE_ID,
          ip: IP,
          locale: LOCALE,
          offer_types: OFFER_TYPES,
          timestamp: Time.now.to_i,
          uid: params[:uid]
        }
    end

    def consume_api(params)
      final_string = build_call_params(params).merge!({ hashkey: get_hashkey(params) })
      request_url = URI.escape(final_string.collect{|k,v| "#{k}=#{v}"}.join('&'))
      conn = get_api_connection
      puts "#{API_PATH}?#{request_url}"
      response = conn.get "#{API_PATH}?#{request_url}"
      result = response.body
      final = JSON.parse(result)
    end
end
