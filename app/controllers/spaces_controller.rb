class SpacesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @spaces = if current_user&.owner?
      Space.where.not(owner_id: current_user.id)
    else
      Space.all
    end
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
    @space.owner = current_user
    @space.availability_status = true
    if @space.save
      redirect_to space_path(@space), notice: "Space created successfully!"
    else
      puts @space.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @space = Space.find(params[:id])
    if @space.destroy
      redirect_to user_dashboard_path, alert: "YOU SUCK"
    end
  end


  private

  def space_params
    params.require(:space).permit(:name, :description, :location, :price_per_day, :price_per_hour, :capacity, :availability_status, :photo )
  end
end
