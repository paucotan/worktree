class SpacesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

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
    @space.owner = current_user  # Ensure the space is assigned to the logged-in user
    @space.availability_status = true  # Set the availability status to true by default
    if @space.save
      redirect_to space_path(@space), notice: "Space created successfully!"
    else
      puts @space.errors.full_messages  # Debugging: Print errors in the console
      render :new, status: :unprocessable_entity
    end
  end

  private

  def space_params
    params.require(:space).permit(:name, :description, :location, :price_per_day, :price_per_hour, :capacity, :availability_status, :photo )
  end
end
