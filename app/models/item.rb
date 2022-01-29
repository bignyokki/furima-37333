class Item < ApplicationRecord
belongs_to :user
has_one_attached :image
extend ActiveHash::Associations::ActiveRecordExtensions
belongs_to :item_info
belongs_to :item_category
belongs_to :item_sales_status
belongs_to :item_shipping_fee_status
belongs_to :prefecture
belongs_to :item_scheduled_delivery
end
