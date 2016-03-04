class CreateActivties < ActiveRecord::Migration
  def change
    create_table :activties do |t|
      t.string :action
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :activties, [:user_id, :created_at]
  end
end
