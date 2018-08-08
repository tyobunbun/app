# frozen_string_literal: true

class AddColumnsToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :micropost_count, :integer, default: 0
  end
end
