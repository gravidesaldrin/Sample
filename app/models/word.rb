class Word < ActiveRecord::Base
  belongs_to :category
  has_many :results
  has_many :word_answers

  validates :content, uniqueness: true

  accepts_nested_attributes_for :word_answers, reject_if:
    lambda {|a| a[:content].blank?}, allow_destroy: true
end
