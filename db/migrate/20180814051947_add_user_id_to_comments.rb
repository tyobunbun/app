# frozen_string_literal: true

class AddUserIdToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :user_id, :bigint, limit: 20, null: false
    add_foreign_key :comments, :users
  end
end
