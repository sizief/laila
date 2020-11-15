# frozen_string_literal: true

class CreateActiveOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :active_orders do |t|
      t.string :position
      t.decimal :amount
      t.decimal :price
      t.timestamps
      t.belongs_to :order
    end
  end
end
