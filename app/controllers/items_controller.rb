class ItemsController < ApplicationController
  before_action :move_to_login, except: :index

  def index
    @item = Item.order("created_at DESC")
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
end
