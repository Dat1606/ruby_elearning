class UncompletedTestJob < ApplicationJob
  queue_as :uncompleted_test

  def perform user_lesson
    @user_lesson = user_lesson
    if @user_lesson.status == 0 
      UserMailer.complete_test(user_lesson).deliver
    end
  end
end
