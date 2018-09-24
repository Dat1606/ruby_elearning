class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.complete_test.subject
  #
  def complete_test user_lesson
    @user_lesson = user_lesson
    @greeting = t("hello")
    @user = User.find_by id: @user_lesson.user_id

    mail to: @user.email, subject: t("test_not_completed")
  end
end
