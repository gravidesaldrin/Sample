class Category < ActiveRecord::Base
  has_many :lessons
  has_many :words, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  accepts_nested_attributes_for :words, reject_if:
    lambda {|a| a[:content].blank?}, allow_destroy: true

  def start_a_lesson user
    lessons.create user_id: user.id, correct_item: 0, total_item: 3
  end
end
