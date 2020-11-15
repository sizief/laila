# frozen_string_literal: true

class FulfilledOrder < ApplicationRecord
  after_create :fulfill_order

  def fulfill_order
    # check for request and match
    # sum of amount if equal order or match amount then they are fulfilled
  end
end
