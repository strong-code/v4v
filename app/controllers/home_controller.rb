class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    unless current_user.confirmed?
      flash[:errors] = "You must confirm your email before continuing!"
    end
  end

end
