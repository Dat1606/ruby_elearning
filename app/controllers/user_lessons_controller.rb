class UserLessonsController < ApplicationController
  before_action :logged_in_user
  before_action :assign_variable, only: [:show, :edit, :update]

  def index
    @user_lessons = (UserLesson.find_by_user current_user.id).order(:id).page params[:page]
  end

  def show
    @result = Result.find_by vocabulary_id: @vocabularies[0].id, user_lesson_id: @user_lesson.id
    if @user_lesson.nil?
      flash[:danger] = t "lesson_not_found"
      redirect_back(fallback_location: root_path)
    end
  end

  def create
    @user_lesson = UserLesson.new(user_lesson_params)
    if @user_lesson.save
      redirect_to user_lesson_path @user_lesson.id
    end
  end

  def update
    @user_lesson.update_attributes(user_lesson_params)
  end

  private

  def user_lesson_params
    params.require(:user_lesson).permit(:lesson_id, :user_id, :point)
  end

  def assign_variable
    @user_lesson = UserLesson.find_by id: params[:id]
    @vocabularies = Vocabulary.find_by_lesson(@user_lesson.lesson_id).order(:id).page params[:page]
    @new_result = Result.new
    @vocabulary = Vocabulary.find_by id: params[:id]
  end
end
