class ItemsController < ApplicationController
  def index
    @items = Items.all
    #@items = Item.paginate(page: params[:page], per_page: 30)
  end
end
