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
		quantity = params["item"]["quantity"]
		id = params[:item_id]
		session[:cart][id] = quantity.to_i
		redirect_to '/cart'
  end

  def destroy
    item = Item.find(params[:item_id].to_i)
    session[:cart].delete(params[:item_id])
    flash[:notice] = %Q[Successfully removed <a href="/items/#{item.id}">#{item.title}</a> from your cart.]
    redirect_to cart_path
  end

	def add
		value = session[:cart][params["item_id"]]
		session[:cart][params["item_id"]] = value + 1  
    redirect_to cart_path
	end 

	def subtract
		value = session[:cart][params["item_id"]]
		session[:cart][params["item_id"]] = value - 1  
		if session[:cart][params["item_id"]] == 0
			session[:cart].delete(params[:item_id])
		end 
    redirect_to cart_path
	end 
end
