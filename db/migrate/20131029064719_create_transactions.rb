class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :uid
      t.string :pub0
      t.integer :page

      t.timestamps
    end
  end
end
