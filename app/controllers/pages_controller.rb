class PagesController < ApplicationController
  before_action :authenticate_user!

  def home
  end

  def dashboard
    @spaces = current_user.spaces
    @bookings = current_user.bookings
  end
end
