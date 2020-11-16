# frozen_string_literal: true
require 'securerandom'

class User < ApplicationRecord
  has_many :orders

  validates :email, uniqueness: true

  before_create :create_token

  scope :find_by_token, ->(token){ where token: token }

  private

  def create_token
    self.token = SecureRandom.base64(24)
  end
end
