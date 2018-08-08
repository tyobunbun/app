# frozen_string_literal: true

class AddColumnsToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :micropost_id, :string
  end
end
