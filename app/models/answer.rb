class Answer < ApplicationRecord
  belongs_to :vocabulary
  has_many :results
end
