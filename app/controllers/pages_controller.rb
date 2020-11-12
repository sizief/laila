class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:profile]

  def index
  end

  def profile
    @user = current_user
  end
end
