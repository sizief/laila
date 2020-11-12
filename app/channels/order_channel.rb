class OrderChannel < ApplicationCable::Channel
  def subscribed
    stream_for 'order are comming'
    # stream_from "some_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def set
  end

  def get
  end
end
