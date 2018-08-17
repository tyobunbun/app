# frozen_string_literal: true

class KeyToComments < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :comments, :users
  end
end
