class UserLesson < ApplicationRecord
  belongs_to :user
  belongs_to :lesson
  has_many :results
  def self.find_by_user user_id
    includes(:user).where("user_id = ?", user_id)
  end

end
