class CoursesController < ApplicationController

  def show
    @current_course = Course.find_by id: params[:id]
    if @current_course.nil?
      flash[:danger] = t "course_not_found"
      redirect_to root_path
    end
    @other_courses = Course.find_other_courses @current_course.id
    @lessons = Lesson.find_by_course @current_course.id
  end
end
