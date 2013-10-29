require "spec_helper"

describe TransactionsController do
  describe "routing" do

    it "routes to #new" do
      get("/transactions/new").should route_to("transactions#new")
    end

    it "routes to #create" do
      post("/transactions").should route_to("transactions#create")
    end

  end
end
