class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :categories

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def categories
    Category.all
  end
end
