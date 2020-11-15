# frozen_string_literal: true

class CreateFulfilleds < ActiveRecord::Migration[6.0]
  def change
    create_table :fulfilled_orders do |t|
      t.decimal :amount
      t.decimal :price
      t.integer :request_order_id
      t.integer :match_order_id
      t.timestamps
    end
  end
end
