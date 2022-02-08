class ItemsController < ApplicationController
  before_action :move_to_login, except: [:index, :show, :destroy]
  before_action :move_to_index, only: :edit
  before_action :set_item, only: [:show, :edit, :update]

  def index
    @item = Item.order('created_at DESC')
    @order = Order.all
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
    @order = Order.find_by(item_id: params[:id])
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy if current_user.id == item.user_id
    redirect_to root_path
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image,
                                 :item_name,
                                 :item_info,
                                 :item_category_id,
                                 :item_sales_status_id,
                                 :item_shipping_fee_status_id,
                                 :prefecture_id,
                                 :item_scheduled_delivery_id,
                                 :item_price).merge(user_id: current_user.id)
  end

  def move_to_login
    redirect_to new_user_session_path unless user_signed_in?
  end

  def move_to_index
    item = Item.find(params[:id])
    order = Order.find_by(item_id: params[:id])
    redirect_to root_path if current_user.id != item.user_id || order.present?
  end

  def set_item
    @item = Item.find(params[:id])
  end
    
end
