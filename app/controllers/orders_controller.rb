class OrdersController < ApplicationController
  def index
  end

  def show
		@order = current_user.orders.find(params[:id])
  end

	def create
		order = current_user.orders.new()
		session[:cart].each do |key, value|
			value.times do 
				order.item_ids << Item.find(key.to_i)
			end 
		end 
		order.save
		flash[:notice] = "Order was successfully placed"
		session.delete(:cart)  
		redirect_to orders_path
	end
end
