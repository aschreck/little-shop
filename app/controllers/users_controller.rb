class UsersController < ApplicationController
  before_action :current_user?, except: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to dashboard_path
      flash[:notice] = "Logged in as #{@user.username}"
    else
      render :new
    end
  end

	def edit
		@user = User.find(current_user.id)
	end 

	def update
		user = User.find(current_user.id)
		user.update(user_params)

		if user.save 
			flash[:notice] = "Account Information Updated!"
			redirect_to '/dashboard'
		else 
			flash[:notice] = "Something Went Wrong! Try Again!"
			render :edit
		end 
	end 

  private

  def user_params
    params.require(:user).permit(:username, :password, :name)
  end
end
