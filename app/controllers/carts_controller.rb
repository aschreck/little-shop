class CartsController < ApplicationController

	def create
    id = params["item_id"].to_s
    @item = Item.find_by(id: id)
    session[:cart] ||= Hash.new(0)
    session[:cart][id] = (session[:cart][id] || 0) + 1
    redirect_to items_path
  end

	def show
    @cart = Cart.new(session[:cart])
	end 

	def update

	end

	
end
