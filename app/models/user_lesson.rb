class UserLesson < ApplicationRecord
  belongs_to :user
  belongs_to :lesson
  has_many :results
  delegate :name, to: :lesson, prefix: true
  after_commit :send_mail

  def self.find_by_user user_id
    includes(:user).where("user_id = ?", user_id)
  end

  def self.collect_id_by_user user_id
    where("user_id = ?", user_id).pluck(:id)
  end

  def send_mail
    UncompletedTestJob.set(wait: Settings.user_lesson.time.hours).perform_later(self)
  end
end
