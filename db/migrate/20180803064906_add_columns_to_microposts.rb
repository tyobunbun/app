class AddColumnsToMicroposts < ActiveRecord::Migration[5.2]
  def change
    add_column :microposts, :category_id, :string
  end
end

