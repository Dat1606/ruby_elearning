class Result < ApplicationRecord
  belongs_to :user_lesson
  belongs_to :vocabulary
  belongs_to :answer

  def self.find_by_user_lesson user_lesson_id
    where("user_lesson_id = ?", user_lesson_id)
  end
end
