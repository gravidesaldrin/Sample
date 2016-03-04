class Word < ActiveRecord::Base
  belongs_to :category

  has_many :lesson_word_answers
  has_many :word_answers
end
