class Vocabulary < ApplicationRecord
  belongs_to :lesson
  has_many :anwers
end
