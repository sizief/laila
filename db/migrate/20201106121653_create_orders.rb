class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :type
      t.decimal :amount
      t.decimal :price
      t.boolean :fulfilled
      t.timestamps
      t.belongs_to :user
    end
  end
end
