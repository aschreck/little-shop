class Admin::OrdersController < ApplicationController
  def update
    order = Order.find(params[:id])
    order.update(status: params[:status])
    redirect_to admin_dashboard_path
  end
end
