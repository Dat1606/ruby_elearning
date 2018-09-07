class VocabulariesController < ApplicationController
    before_action :assign_variables, only: [:index]

  def index
    @vocabularies = Vocabulary.all
    if params[:lessons]
      if params[:lessons] == "0"
        @lesson_ids = Lesson.pluck(:id)
        @vocabularies_by_lesson = Vocabulary.find_by_lesson_ids @lesson_ids
        @vocabularies = @vocabularies_by_lesson
        respond_to :js
      else
        @lesson = Lesson.find_by id: params[:lessons]
        @vocabularies_by_lesson = Vocabulary.find_by_lesson @lesson.id
        @vocabularies = @vocabularies_by_lesson
        respond_to :js
      end
      if params[:vocabularies] && params[:vocabularies] == "0"
        @vocabularies = @vocabularies_by_lesson
        respond_to :js
      elsif params[:vocabularies] && params[:vocabularies] == "1"
        @vocabularies = @vocabularies_by_lesson.find_by_ids @learned_vocabulary_ids
        respond_to :js
      elsif params[:vocabularies] && params[:vocabularies] == "2"
        @vocabularies = @vocabularies_by_lesson.find_unlearned_words @learned_vocabulary_ids
        respond_to :js
      end
    end
  end

  private

  def assign_variables
    @lessons = Lesson.all
    @user_lesson_ids = UserLesson.collect_id_by_user current_user.id
    @learned_vocabulary_ids = Result.find_by_multi_user_lesson(@user_lesson_ids).uniq!
  end
end
