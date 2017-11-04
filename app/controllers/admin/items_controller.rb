class Admin::ItemsController < BaseController

  def index
    @items = Item.all
  end

end
