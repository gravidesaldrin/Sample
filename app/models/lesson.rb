class Lesson < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  has_many :lesson_word_answers
end
