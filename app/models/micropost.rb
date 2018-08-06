class Micropost < ApplicationRecord
  belongs_to :user
  has_many :category_microposts
  has_many :categories, through: :category_microposts
  has_one_attached :image
  validates :content, presence: true, length: { maximum: 140 }
end
