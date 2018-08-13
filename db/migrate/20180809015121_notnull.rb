# frozen_string_literal: true

class Notnull < ActiveRecord::Migration[5.2]
  def change
    # Change table Users
    change_column_null :users, :name, false
    # Change table Microposts
    change_column_null :microposts, :content, false
    change_column :microposts, :user_id, :bigint, limit: 20, null: false
   # add_foreign_key :microposts, :users
   # Change table Category_microposts
   change_column :category_microposts, :micropost_id, :bigint, limit: 20, null: false # rubocop:disable all
   change_column :category_microposts, :category_id, :bigint, limit: 20, null: false # rubocop:disable all
    # Change table Categories
    change_column_null :categories, :name, false
    # Change table Comments
    change_column_null :comments, :name, false
    change_column_null :comments, :comment, false
    change_column :comments, :micropost_id, :bigint, limit: 20, null: false
    add_foreign_key :comments, :microposts
  end
end
