json.array!(@transactions) do |transaction|
  json.extract! transaction, :uid, :pub0, :page
  json.url transaction_url(transaction, format: :json)
end
