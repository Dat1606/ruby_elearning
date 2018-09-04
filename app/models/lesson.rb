class Lesson < ApplicationRecord
  belongs_to :course
  has_many :vocabularies

  def self.find_by_course course_id
    where("course_id = ?", course_id)
  end
end
