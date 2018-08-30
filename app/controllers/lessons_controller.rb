class LessonsController < ApplicationController

  def show
    @current_lesson = Lesson.find_by id: params[:id]
    @vocabularies = Vocabulary.find_by_lesson @current_lesson.id
  end
end
