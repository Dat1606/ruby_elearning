class Vocabulary < ApplicationRecord
  belongs_to :lesson
  has_many :anwers
  validates :name, presence: true
  validates :description, presence: true
  validates :example, presence: true
  enum status: {not_answered_yet: 0, right: 1, wrong: 2}
  paginates_per 1

  def self.find_by_lesson lesson_id
    includes(:lesson).where("lesson_id = ?", lesson_id)
  end

  def self.find_by_lesson_ids lesson_ids
    where("lesson_id in (?)", lesson_ids)
  end

  def self.find_by_result result_vocabulary_id
    includes(:result).where("id = ?", result_vocabulary_id)
  end

  def self.find_by_ids vocabulary_ids
    where("id IN (?)", vocabulary_ids)
  end

  def self.find_unlearned_words learned_word_ids
    where.not("id IN (?)", learned_word_ids)
  end
end
