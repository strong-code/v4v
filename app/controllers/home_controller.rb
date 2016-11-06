class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    puts " >>>>>>>>>>>>>>>>>>>>>"
    p current_user.confirmed?
    unless current_user.confirmed?
      puts "confirm!"
      flash[:errors] = "You must confirm your email"
    end
  end

end
