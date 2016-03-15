class Lesson < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :results, dependent: :destroy

  accepts_nested_attributes_for :results, allow_destroy: true

  def answered word_answer
    results.create word_answer_id: word_answer.id, word_id: word_answer.word_id

    if self.results.count == self.total_item
      self.correct_item = self.results.select{|r| r.word_answer.correct? }.count
      self.finished_time = Time.now
      self.save
    end
  end

  def final_result
    "#{self.correct_item}/#{self.total_item}"
  end

end
