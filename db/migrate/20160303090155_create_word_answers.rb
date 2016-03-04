class CreateWordAnswers < ActiveRecord::Migration
  def change
    create_table :word_answers do |t|
      t.string :label
      t.boolean :correct
      t.references :word, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :word_answers, [:word_id, :label]
    add_index :word_answers, [:word_id, :label, :correct], unique: true
  end
end
