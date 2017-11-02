class BaseController < ApplicationController
  before_action :current_user?

  def dashboard
    @user = User.find(session[:user_id])
  end

end
