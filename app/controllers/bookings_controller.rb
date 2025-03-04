class BookingsController < ApplicationController
  before_action :authenticate_user!
  def create
    @space = Space.find(params[:space_id])
    @booking = Booking.new(booking_params)
    @booking.space = @space
    @booking.user = current_user

    if @booking.save
      redirect_to user_dashboard_path, notice: 'Booking was successfully created.'
    else
      render :new
    end
  end

  def update; end

  def destroy; end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status, :space_id, :user_id)
  end
end
