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
    end_date = booking_params[:start_date].split(" to ").last
    @booking.end_date = end_date


    if @booking.save
      flash[:notice] = "Your booking request has been submitted."
      redirect_to space_path(@space)
    else
      flash[:alert] = "Something went wrong. Please try again."
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
    if @booking.destroy
      redirect_to user_dashboard_path, alert: "YOU SUCK"
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:space_id, :renter_id, :start_date, :end_date, :status)
  end
end
