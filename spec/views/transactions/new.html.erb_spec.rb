require 'spec_helper'

describe "transactions/new" do
  before(:each) do
    assign(:transaction, stub_model(Transaction,
      :uid => "MyString",
      :pub0 => "MyString",
      :page => 1
    ).as_new_record)
  end

  it "renders new transaction form" do
    render

    
    assert_select "form[action=?][method=?]", transactions_path, "post" do
      assert_select "input#transaction_uid[name=?]", "transaction[uid]"
      assert_select "input#transaction_pub0[name=?]", "transaction[pub0]"
      assert_select "input#transaction_page[name=?]", "transaction[page]"
    end
  end
end
