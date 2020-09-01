class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :condition, :delv_fee, :delv_time, :prefecture
  has_one_attached :image
end
