class SpacesController < ApplicationController
  before_action :authenticate_user!

  def index
    @spaces = Space.all
  end

  def show
    @space = Space.find(params[:id])
    @booking = Booking.new
  end

  def new
    @space = Space.new
  end

  def create
    @space = Space.new(space_params)
    if @space.save
      redirect_to @space, notice: "Space was successfully created."
    else
      render :new
    end
  end

  private

  def space_params
    params.require(:space).permit(:name, :description, :location, :price_per_day, :price_per_hour, :capacity, :availability_status, )
  end
end
