# frozen_string_literal: true

class Micropost < ApplicationRecord
  belongs_to :user
  delegate :name, to: :user, prefix: true
  has_many :category_microposts, dependent: :delete_all
  has_many :comments, dependent: :delete_all
  has_many :categories, through: :category_microposts, dependent: :delete_all
  has_one_attached :image, dependent: :delete_all
  validates :content, presence: true, length: { maximum: 140 }
end
