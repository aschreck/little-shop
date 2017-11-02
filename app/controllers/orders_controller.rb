class OrdersController < ApplicationController
  def index
  end

  def show
		@order = current_user.orders.find(params[:id])
  end

	def create
		order = current_user.orders.create()
		session[:cart].each do |key, value|
			value.times do 
				order.update_attribute(order.item_ids, key.to_i)
			end
		end
		order
		order.save
		flash[:notice] = "Order was successfully placed"
		session.delete(:cart)
		redirect_to orders_path
	end
end
