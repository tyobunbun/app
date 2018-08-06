class CreateCategoryMicroposts < ActiveRecord::Migration[5.2]
  def change
    create_table :category_microposts do |t|
      t.integer :category_id
      t.integer :micropost_id

      t.timestamps
    end
  end
end
