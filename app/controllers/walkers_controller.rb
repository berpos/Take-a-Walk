class WalkersController < ApplicationController
  before_action :set_walkers, only: %i[show edit update destroy]

  def index
    @walkers = Walker.all

    if params[:query].present?
      sql_subquery = "first_name ILIKE :query OR last_name ILIKE :query"
      @walkers = @walkers.where(sql_subquery, query: "%#{params[:query]}%")
    else
      @walkers = Walker.all
    end

    @nearby = Walker.near(current_user.address, 10)
  end

  def show
    @booking = Booking.new
  end

  def new
    @walker = Walker.new
  end

  def create
    @walker = Walker.new(walker_params)
    @walker.user_id = current_user.id
    if @walker.save
      redirect_to my_walkers_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @walker.update(walker_params)
      redirect_to walker_path(@walker), notice: "Walker was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @walker.destroy
    redirect_to my_walkers_path, status: :see_other
  end

  def my_walkers
    @walkers = Walker.where(user_id: current_user.id)
  end

  private

  def set_walkers
    @walker = Walker.find(params[:id])
  end

  def walker_params
    params.require(:walker).permit(:first_name, :last_name, :phone_number, :description, :address, photos: [])
  end
end
