# frozen_string_literal: true

class ActiveOrder < ApplicationRecord
  belongs_to :order
  after_create :run_match_engine

  def reverse_position
    position == Order::BUY ? Order::SELL : Order::BUY
  end

  def buy?
    position == Order::BUY
  end

  def run_match_engine
    Match::Engine.run(self)
  end
end
