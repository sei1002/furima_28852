class OrdersController < ApplicationController

  def index

    @order = OrderAddress.new

    if user_signed_in? 
      @item = Item.find(params[:item_id])
    else
      redirect_to user_session_path
    end

    if user_signed_in? && current_user.id == @item.user_id 
      redirect_to root_path
    end

    if @item.order
      redirect_to root_path
    end
    
  end

  def create
    @order = OrderAddress.new(order_params)
    @item = Item.find(params[:item_id])
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit( :postal_code, :prefecture_id, :city, :address, :build_name, :tel, :order_id).merge(user_id: current_user.id, order_id: params[:order_id], item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    
    Payjp.api_key = "sk_test_4107de1a6af9583770a0d02b"  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end
 
end
