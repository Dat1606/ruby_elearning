class Answer < ApplicationRecord
  belongs_to :vocabulary
  has_many :results
  validates_presence_of :content

  def self.find_by_vocabulary vocabulary_id
    Answer.includes(:vocabulary).where("vocabulary_id = ?", vocabulary_id)
  end
end
