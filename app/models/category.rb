# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :category_microposts, dependent: :delete_all
  has_many :microposts, through: :category_microposts, dependent: :delete_all
end
