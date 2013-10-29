require 'spec_helper'

describe "transactions/index" do
  before(:each) do
    assign(:transactions, [
      stub_model(Transaction,
        :uid => "Uid",
        :pub0 => "Pub0",
        :page => 1
      ),
      stub_model(Transaction,
        :uid => "Uid",
        :pub0 => "Pub0",
        :page => 1
      )
    ])
  end

  it "renders a list of transactions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Uid".to_s, :count => 2
    assert_select "tr>td", :text => "Pub0".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
