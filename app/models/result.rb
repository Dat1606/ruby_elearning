class Result < ApplicationRecord
  belongs_to :user_lesson
  belongs_to :vocabulary
  belongs_to :answer
end
