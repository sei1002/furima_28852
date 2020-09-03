class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :move_to_index, except: [:index, :show, :update, :destroy]

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
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to root_path unless current_user.id == @item.user_id
  end

  def item_params
    params.require(:item).permit(:name, :price, :description, :image, :category_id, :condition_id, :delv_fee_id, :delv_time_id, :prefecture_id).merge(user_id: current_user.id)
  end
end
