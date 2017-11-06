class Admin::ItemsController < Admin::BaseController

  def index
    @items = Item.all
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if params[:item]
      @item.update(item_params)
    else
      @item.update(status: params[:status])
    end
    if @item.save
      flash[:notice] = "The item was updated!"
      redirect_to admin_items_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :price, :image, :status)
  end

end
