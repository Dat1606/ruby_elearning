class Vocabulary < ApplicationRecord
  belongs_to :lesson
  has_many :anwers
  enum status: {not_answered_yet: 0, right: 1, wrong: 2}

  def self.find_by_lesson lesson_id
    where("lesson_id = ?", lesson_id)
  end
end
