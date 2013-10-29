require 'spec_helper'

describe TransactionsController do

  # This should return the minimal set of attributes required to create a valid
  # Transaction. As you add validations to Transaction, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "uid" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TransactionsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET new" do
    it "assigns a new transaction as @transaction" do
      get :new, {}, valid_session
      assigns(:transaction).should be_a_new(Transaction)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Transaction" do
        expect {
          post :create, {:transaction => valid_attributes}, valid_session
        }.to change(Transaction, :count).by(1)
      end

      it "assigns a newly created transaction as @transaction" do
        post :create, {:transaction => valid_attributes}, valid_session
        assigns(:transaction).should be_a(Transaction)
        assigns(:transaction).should be_persisted
      end

      it "redirects to the created transaction" do
        post :create, {:transaction => valid_attributes}, valid_session
        response.should eq(200)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved transaction as @transaction" do
        # Trigger the behavior that occurs when invalid params are submitted
        Transaction.any_instance.stub(:save).and_return(false)
        post :create, {:transaction => { "uid" => "invalid value" }}, valid_session
        assigns(:transaction).should be_a_new(Transaction)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Transaction.any_instance.stub(:save).and_return(false)
        post :create, {:transaction => { "uid" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

end
