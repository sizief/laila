class Order < ApplicationRecord
  belongs_to :user
  has_one :active_order, :dependent => :destroy
  after_create :create_active_order

  POSITIONS = [
    BUY = 'buy',
    SELL = 'sell'
  ]

  validates :position, inclusion: {in: POSITIONS,message: "position is not valid"}

  def create_active_order
    ActiveOrder.create(
      position: self.position,
      amount: self.amount,
      price: self.price,
      order: self
    )
  end
end
