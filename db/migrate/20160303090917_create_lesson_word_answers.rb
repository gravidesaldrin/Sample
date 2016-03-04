class CreateLessonWordAnswers < ActiveRecord::Migration
  def change
    create_table :lesson_word_answers do |t|
      t.references :lesson, index: true, foreign_key: true
      t.references :word, index: true, foreign_key: true
      t.references :word_answer, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :lesson_word_answers, [:lesson_id, :word_id]
    add_index :lesson_word_answers, [:lesson_id, :word_answer_id]
  end
end
