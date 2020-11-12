module ApplicationCable
  class Channel < ActionCable::Channel::Base
     identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    private

    def find_verified_user
      verified_user = User.find_by(id: cookies.encrypted[:user_id])
      binding.pry
      verified_user.nil? ? reject_unauthorized_connection : verified_user
    end
  end
end
