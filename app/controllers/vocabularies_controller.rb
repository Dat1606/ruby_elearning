class VocabulariesController < ApplicationController
    before_action :assign_variables, only: [:index]

  def index
    #Filter words with two conditions: lessons and status: (learned, unlearned,...)
    @vocabularies = Vocabulary.all.order(:id).page(params[:page]).per(15)
    if params[:lessons]
      if params[:lessons] == "0"
        @lesson_ids = Lesson.pluck(:id)
        @vocabularies = Vocabulary.find_by_lesson_ids @lesson_ids
      else
        @lesson = Lesson.find_by id: params[:lessons]
        return unless @lesson
        @vocabularies = Vocabulary.find_by_lesson_ids @lesson.id
      end
      if params[:vocabularies] && params[:vocabularies] == "0"
        @vocabularies
        respond_to :js
      elsif params[:vocabularies] && params[:vocabularies] == "1"
        @vocabularies = @vocabularies.find_by_ids(@learned_vocabulary_ids)
        respond_to :js
      elsif params[:vocabularies] && params[:vocabularies] == "2"
        @vocabularies = @vocabularies.find_unlearned_words(@learned_vocabulary_ids)
        respond_to :js
      end
    end
  end

  private

  def assign_variables
    @lessons = Lesson.all
    @user_lesson_ids = UserLesson.collect_id_by_user current_user.id
    @learned_vocabulary_ids = Result.find_by_multi_user_lesson(@user_lesson_ids).uniq
  end
end
