class Category < ApplicationRecord
    has_many :category_microposts
    has_many :microposts, through: :category_microposts
end
