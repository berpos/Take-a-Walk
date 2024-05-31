class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    # No need for app/views/restaurants/update.html.erb
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :phone_number, :email, :company_name, :address, :photo)
  end
end
