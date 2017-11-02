class BaseController < ApplicationController
  def dashboard
    @user = User.find(session[:user_id])
  end

  
end
