class Result < ApplicationRecord
  belongs_to :user_lesson
  belongs_to :vocabulary
  belongs_to :answer

  def self.find_by_user_lesson user_lesson_id
    where("user_lesson_id = ?", user_lesson_id)
  end

  def self.find_by_vocabulary vocabulary_id
    where("vocabulary_id = ?", vocabulary_id)
  end

  def self.find_by_multi_user_lesson user_lesson_id_array
    where("user_lesson_id IN (?) AND status = 1", user_lesson_id_array).pluck(:vocabulary_id)
  end
end
