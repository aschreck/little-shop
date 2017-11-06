class ItemsController < ApplicationController
  def index
    @items = Item.all
    #@items = Item.paginate(page: params[:page], per_page: 30)
  end
end
