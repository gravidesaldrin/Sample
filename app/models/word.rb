class Word < ActiveRecord::Base
  belongs_to :category
  has_many :results
  has_many :word_answers

  validates :content, uniqueness: true
end
