class BookingsController < ApplicationController
  # We need to find the user associated with the booking
  before_action :set_walker, only: %i[new create]

  def new
    @booking = Booking.new
  end

  def create
    # we need to find the user associated with the booking
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.walker = @walker
    if @booking.save
      redirect_to my_bookings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def my_bookings
    @my_bookings = Booking.where(user: current_user)
    @user = current_user
  end

  private

  def set_walker
    @walker = Walker.find(params[:walker_id])
  end

  def booking_params
    # .require is used to check if the top level key is present in params,
    # if key is not present .require throws an error
    params.require(:booking).permit(:start_date, :end_date)
  end
end
