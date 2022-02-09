class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :price, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
    validates :city
    validates :addresses
    validates :phone_number, format: {with: /\A0[0-9]{9,10}\z/}
    validates :price
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    DeliveryAddress.create(
                  postal_code: postal_code,
                  prefecture_id: prefecture_id,
                  city: city,
                  addresses: addresses,
                  building: building,
                  phone_number: phone_number,
                  order_id: order.id
                  )
  end
end