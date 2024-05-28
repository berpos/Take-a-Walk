class WalkersController < ApplicationController
  before_action :set_walkers, only: %i[show]

  def index
    @walkers = Walker.all
  end

  def show
    @booking = Booking.new
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_walkers
    @walker = Walker.find(params[:id])
  end

  def walker_params
    params.require(:walker).permit(:first_name, :last_name)
  end
end
