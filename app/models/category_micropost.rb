# frozen_string_literal: true

class CategoryMicropost < ApplicationRecord
  belongs_to :category, counter_cache: :micropost_count
  belongs_to :micropost
end
