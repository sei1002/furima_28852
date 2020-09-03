class ItemsController < ApplicationController
  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  
  private

  def item_params
    params.require(:item).permit(:name, :price, :description, :image, :category_id, :condition_id, :delv_fee_id, :delv_time_id, :prefecture_id).merge(user_id: current_user.id)
  end
end
