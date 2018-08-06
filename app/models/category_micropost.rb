class CategoryMicropost < ApplicationRecord
    belongs_to :category
    belongs_to :micropost
end
