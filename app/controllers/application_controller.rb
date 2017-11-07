class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :categories, :current_admin?, :set_cart

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def categories
    Category.all
  end

  def current_admin?
    current_user && current_user.admin?
  end

  def current_user?
    render file: "/public/404" unless current_user
  end

  def set_cart
    Cart.new(session[:cart]) || Cart.new()
  end
end
