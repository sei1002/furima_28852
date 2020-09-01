class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, :kana_first, :kana_last, :birthday, :nickname, presence: true
  validates :password, format: { with: /(?=.*\d+.*)(?=.*[a-zA-Z]+.*)./, message: " Include both letters and numbers" }
  validates :first_name, :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters"}
  validates :kana_first, :kana_last, format: { with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters"}
end