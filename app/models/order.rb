# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user
  has_one :active_order, dependent: :destroy
  after_create :create_active_order

  POSITIONS = [
    BUY = 'buy',
    SELL = 'sell'
  ].freeze

  validates :position, inclusion: { in: POSITIONS, message: 'position is not valid' }

  def create_active_order
    ActiveOrder.create(
      position: position,
      amount: amount,
      price: price,
      order: self
    )
  end
end
