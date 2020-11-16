class TokenController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: {token: current_user.token}
  end

  def delete; end
end
