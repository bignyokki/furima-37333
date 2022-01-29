class Item < ApplicationRecord
  belongs_to :user

  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_sales_status
  belongs_to :item_shipping_fee_status
  belongs_to :prefecture
  belongs_to :item_scheduled_delivery

  

  validates :item_name,                   presence: true
  validates :item_info,                   presence: true
  validates :item_category_id,            presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :item_sales_status_id,        presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :item_shipping_fee_status_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id,               presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :item_scheduled_delivery_id,  presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :item_price,                  presence: true
end
