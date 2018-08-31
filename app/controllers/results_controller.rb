class ResultsController < ApplicationController
  before_action :find_variables, only: [:create]

  def create
    @answer = Answer.find_by id: @result.answer_id
    if @result.save
      if @answer.status == true
        @user_lesson.update_attribute(:point, (@user_lesson.point += 1))
      end
      respond_to do |format|
        format.js
      end
    end
  end

  def destroy
  end

  private

  def result_params
    params.require(:result).permit(:user_lesson_id, :vocabulary_id, :answer_id)
  end

  def find_variables
    @result = Result.new(result_params)
    @vocabulary = Vocabulary.find_by id: @result.vocabulary_id
    @user_lesson = UserLesson.find_by id: @result.user_lesson_id
  end
end
