class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :cat_name

      t.timestamps null: false
    end
    add_index :categories, :cat_name
  end
end
