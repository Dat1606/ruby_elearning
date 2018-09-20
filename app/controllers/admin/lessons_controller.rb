class Admin::LessonsController < Admin::AdminBaseController
  before_action :load_lesson, except: [:new, :index]
  before_action :logged_in_user, :admin_user
  
  def index
    if admin_user?
      @lessons = Lesson.order(:id).page params[:page]
    else
      redirect_to root_path
    end
  end

  def new; end

  def edit
    @vocabularies = Vocabulary.find_by_lesson @lesson.id
  end

  def create
    @lesson = Lesson.new(lesson_params)
    if @lesson.save
      flash[:info] = t "lesson_created"
      redirect_back(fallback_location: root_path)
    else
      flash[:danger] = @lesson.errors.full_messages
      redirect_back(fallback_location: root_path)
    end
  end

  def update
    if @lesson.update_attributes(lesson_params)
      flash[:success] = t "all_changes_reserved"
      redirect_to admin_lessons_path
    else
      flash[:danger] = @lesson.errors.full_messages
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    if @lesson.destroy
      flash[:success] = t "lesson_deleted"
    else
      flash[:danger] = @lesson.errors.full_messages
    end
    redirect_to admin_lessons_path
  end

  private

  def lesson_params
    params.require(:lesson).permit(:name, :course_id, vocabularies_attributes: [:name, :description, :example, :id, :_destroy])
  end

  def load_lesson
    @lesson = Lesson.find_by id: params[:id]
    return unless @lesson
  end
end
