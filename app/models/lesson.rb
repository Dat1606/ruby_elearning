class Lesson < ApplicationRecord
  belongs_to :course
  has_many :vocabularies, dependent: :destroy
  accepts_nested_attributes_for :vocabularies, allow_destroy: true
  validates :name, presence: true
  validates_format_of :name, :with => /\A[^0-9`!@#\$%\^&*+_=]+\z/
  
  def self.find_by_course course_id
    where("course_id = ?", course_id)
  end
end
