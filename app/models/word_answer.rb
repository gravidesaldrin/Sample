class WordAnswer < ActiveRecord::Base
  belongs_to :word

  has_many :lesson_word_answers
end
