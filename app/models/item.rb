class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :condition, :delv_fee, :delv_time, :prefecture
  has_one_attached :image
  belongs_to :user

  validates :name, :price, :description, :image, :category, :condition, :delv_fee, :delv_time, :prefectures, presence: true
  validates :category, :condition, :delv_fee, :delv_time, :prefectures, numericality: { other_than: 0 }
  validates :price, ,format: { with: /\A[0-9]+\z/, message: 'Half-width number' }
  validates :price, numericality: { :greater_than_or_equal_to: 300, :less_than_or_equal_to: 9999999, message: ' Out of setting range'}
end
