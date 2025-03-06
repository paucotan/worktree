class BookingsController < ApplicationController
  before_action :authenticate_user!

  def new
    @space = Space.find(params[:space_id])
    @booking = Booking.new
  end

  def create
    @space = Space.find(params[:space_id])
    @booking = Booking.new(booking_params)
    @booking.space = @space
    @booking.renter = current_user
    @booking.status = "pending"

    if @booking.save
      redirect_to space_path(@booking.space), notice: 'Booking was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    if current_user.owner?
      @bookings = Booking.where(space_id: current_user.spaces.pluck(:id))
    else
      @bookings = Booking.where(renter_id: current_user.id)
    end
  end

  def show
  end

  def update
    @booking = Booking.find(params[:id])

    if current_user.owner?
      if params[:status] == 'accepted'
        @booking.update(status: 'accepted')
      elsif params[:status] == 'declined'
        @booking.update(status: 'declined')
      end
    end
    redirect_to user_dashboard_path
  end

  def accept
    @booking = Booking.find(params[:id])
    if current_user.owner?
      @booking.update(status: 'accepted')
      redirect_to user_dashboard_path, notice: 'Booking accepted.'
    else
      redirect_to user_dashboard_path, alert: 'You are not authorized to accept bookings.'
    end
  end

  def decline
    @booking = Booking.find(params[:id])
    if current_user.owner?
      @booking.update(status: 'declined')
      redirect_to user_dashboard_path, notice: 'Booking declined.'
    else
      redirect_to user_dashboard_path, alert: 'You are not authorized to decline bookings.'
    end
  end

  def destroy
    @booking = Booking.find(params[:id])

    if @booking.space.owner == current_user
      @booking.destroy
      redirect_to user_dashboard_path, notice: 'Booking was successfully deleted.'
    else
      redirect_to user_dashboard_path, alert: 'You are not authorized to delete this booking.'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:space_id, :renter_id, :start_date, :end_date, :status)
  end
end
