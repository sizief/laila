# frozen_string_literal: true

require 'securerandom'

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders

  validates :email, uniqueness: true

  before_create :create_token

  scope :find_by_token, ->(token) { where token: token }

  private

  def create_token
    self.token = SecureRandom.base64(24)
  end
end
