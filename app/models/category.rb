class Category < ActiveRecord::Base
  has_many :lessons
  has_many :words, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  accepts_nested_attributes_for :words, reject_if:
    lambda {|a| a[:content].blank?}, allow_destroy: true
end
