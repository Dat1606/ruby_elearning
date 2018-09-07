class UserLesson < ApplicationRecord
  belongs_to :user
  belongs_to :lesson
  has_many :results

  def self.find_by_user user_id
    includes(:user).where("user_id = ?", user_id)
  end

  def self.collect_id_by_user user_id
    where("user_id = ?", user_id).pluck(:id)
  end
end
