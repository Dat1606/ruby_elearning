class Admin::CoursesController < Admin::AdminBaseController
  before_action :find_course, only: [:edit, :update, :destroy]

  def index
    @courses = Course.order(:id).page params[:page]
  end

  def new
    @course = Course.new
  end

  def edit; end

  def create
    @course = Course.new course_params

    if @course.save
      flash[:info] = t "course_created"
    else
      flash[:danger] = @course.errors.full_messages
    end
    redirect_back fallback_location: root_path
  end

  def update
    if @course.update_attributes course_params 
      flash[:success] = t "all_changes_reserved"
      redirect_to admin_courses_path
    else
      flash[:danger] = @course.errors.full_messages
      redirect_back fallback_location: root_path
    end
  end

  def destroy
    if @course.destroy
      flash[:success] = t "lesson_deleted"
    else
      flash[:danger] = @course.errors.full_messages
    end
    redirect_to admin_courses_path
  end

  private

  def find_course
    @course = Course.find_by id: params[:id]
    return unless @course
  end

  def course_params
    params.require(:course).permit :name, :description, :image
  end
end
