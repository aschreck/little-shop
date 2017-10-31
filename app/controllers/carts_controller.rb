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

  def destroy
    item = Item.find(params[:item_id].to_i)
    session[:cart].delete(params[:item_id])
    flash[:notice] = %Q[Successfully removed <a href="/items/#{item.id}">#{item.title}</a> from your cart]
    redirect_to cart_path
  end
end
