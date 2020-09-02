class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delv_fee
  belongs_to_active_hash :delv_time
  belongs_to_active_hash :prefecture
  has_one_attached :image
  belongs_to :user

  validates :name, :price, :description, :image, :category_id, :condition_id, :delv_fee_id, :delv_time_id, :prefecture_id, presence: true
  validates :category_id, :condition_id, :delv_fee_id, :delv_time_id, :prefecture_id, numericality: { other_than: 0 }
  validates :price, format: { with: /\A[0-9]+\z/, message: 'Half-width number' }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: ' Out of setting range'}
end
