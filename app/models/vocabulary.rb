class Vocabulary < ApplicationRecord
  belongs_to :lesson
  has_many :anwers
  enum status: {not_answered_yet: 0, right: 1, wrong: 2}
  paginates_per 1

  def self.find_by_lesson lesson_id
    includes(:lesson).where("lesson_id = ?", lesson_id)
  end

  def self.find_by_result result_vocabulary_id
    includes(:result).where("id = ?", result_vocabulary_id)
  end
end
