class Course < ApplicationRecord
  has_many :lessons
  mount_uploader :image, PictureUploader

  def self.find_other_courses current_course_id
    where.not id: current_course_id
  end
end
