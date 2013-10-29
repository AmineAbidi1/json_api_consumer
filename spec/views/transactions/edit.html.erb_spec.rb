require 'spec_helper'

describe "transactions/edit" do
  before(:each) do
    @transaction = assign(:transaction, stub_model(Transaction,
      :uid => "MyString",
      :pub0 => "MyString",
      :page => 1
    ))
  end

  it "renders the edit transaction form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", transaction_path(@transaction), "post" do
      assert_select "input#transaction_uid[name=?]", "transaction[uid]"
      assert_select "input#transaction_pub0[name=?]", "transaction[pub0]"
      assert_select "input#transaction_page[name=?]", "transaction[page]"
    end
  end
end
