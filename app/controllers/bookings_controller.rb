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
    if current_user.role == "owner"
      @bookings = Space.where(owner_id: current_user.id)
    else
      @bookings = Booking.where(renter_id: current_user.id)
    end
  end


  def show
  end

  def update
    @booking = Booking.find(params[:booking_id])
    @booking.update(booking_params)
    # TODO: This needs to redirect to the proper page
    if @booking.save
      redirect_to user_dashboard_path
    end
  end

  def destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:space_id, :user_id, :start_date, :end_date, :status)
  end
end
