class OrderAddress

  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture_id, :city, :address, :build_name, :tel, :order_id, :user_id, :item_id

  validates :token, presence: true
  validates :postal_code, :prefecture_id, :city, :address, :tel, presence: true 
  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :tel, format: {with: /\A\d{10,11}\z/}
  validates :prefecture_id, numericality: { other_than: 0 }

  def save
    order_id = Order.create(user_id: user_id, item_id: item_id)

    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, build_name: build_name, tel: tel, order_id: order_id.id)
  end

end