class Admin::BaseController < ApplicationController
  before_action :require_admin

  def dashboard
    @admin = User.find(session[:user_id])
		@orders = Order.all
  end

  private

  def require_admin
    render file: "/public/404" unless current_admin?
  end
end
