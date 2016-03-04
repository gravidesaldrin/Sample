class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :word
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :words, :word
    add_index :words, [:category_id, :word], unique: true
  end
end