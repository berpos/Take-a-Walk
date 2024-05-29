class WalkersController < ApplicationController
  before_action :set_walkers, only: %i[show edit update]

  def index
    @walkers = Walker.all
  end

  def show
    @booking = Booking.new
  end

  def new
    @walker = Walker.new
  end

  def create
    @walker = Walker.new(walker_params)
    if @walker.save
      redirect_to walker_path(@walker)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @set_walkers.update(walker_params)
    redirect_to walker_path(@walker)
  end

  def destroy
  end

  private

  def set_walkers
    @walker = Walker.find(params[:id])
  end

  def walker_params
    params.require(:walker).permit(:first_name, :last_name, :phone_number, photos: [])
  end
end
