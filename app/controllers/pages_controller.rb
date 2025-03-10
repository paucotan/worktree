class PagesController < ApplicationController
  before_action :authenticate_user!

  def home
  end

  def dashboard
    if current_user.owner?
      @spaces = current_user.spaces
      @bookings = Booking.joins(:space).where(spaces: { owner_id: current_user.id })
    elsif current_user.renter?
      @bookings = Booking.where(renter_id: current_user.id)
    end
  end
end
