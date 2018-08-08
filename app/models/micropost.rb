# frozen_string_literal: true

class Micropost < ApplicationRecord
  belongs_to :user
  delegate :name, to: :user, prefix: true
  has_many :category_microposts
  has_many :categories, through: :category_microposts
  has_many :comments
  has_one_attached :image
  validates :content, presence: true, length: { maximum: 140 }
end
