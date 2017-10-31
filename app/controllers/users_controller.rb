class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    binding.pry
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to dashboard_path
      flash[:notice] = "Logged in as #{@user.username}"
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :name)
  end
end