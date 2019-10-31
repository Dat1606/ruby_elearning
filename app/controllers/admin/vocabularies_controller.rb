class Admin::VocabulariesController < Admin::AdminBaseController
  before_action :logged_in_user, :admin_user
  before_action :load_vocabulary, only: [:edit, :update, :destroy]
 
  def index
    @vocabularies = Vocabulary.order(:id).page(params[:page]).per(25)
    @lessons = Lesson.all
    if params[:lessons]
      if params[:lessons] == "0"
        @vocabularies = Vocabulary.order(:id).page(params[:page]).per(25)
        respond_to :js
      else
        @lesson = Lesson.find_by id: params[:lessons]
        return unless @lesson
        @vocabularies = Vocabulary.find_by_lesson(@lesson.id).per(25)
        respond_to :js
      end
    end
  end

  def new
    @vocabulary = Vocabulary.new
    Settings.answer.number.times do 
      @vocabulary.answers.build
    end
  end

  def edit
    @answers = Answer.find_by_vocabulary @vocabulary.id
    if @answers.blank?
      Settings.answer.number.times do 
        @vocabulary.answers.build
      end
    end
  end

  def create
    if params[:vocabulary][:answers_attributes]
      #Receive only one correct answer
      if params[:vocabulary][:answers_attributes]["0"][:status] == "1" || params[:vocabulary][:answers_attributes]["1"][:status] == "1" ||
          params[:vocabulary][:answers_attributes]["2"][:status] == "1" || params[:vocabulary][:answers_attributes]["3"][:status] == "1"
    
        @vocabulary = Vocabulary.new vocabulary_params
        if @vocabulary.save
          flash[:info] = t "vocabulary_created"
          redirect_back(fallback_location: root_path)
        else
          flash[:danger] = @vocabulary.errors.full_messages
          redirect_back(fallback_location: root_path)
        end
      else
        flash[:info] = t "please_choose_right_answer"
        redirect_back(fallback_location: root_path)
      end
    end
  end

  def update
    if params[:vocabulary][:answers_attributes]
      #Receive only one correct answer
      if params[:vocabulary][:answers_attributes]["0"][:status] == "1" || params[:vocabulary][:answers_attributes]["1"][:status] == "1" ||
        params[:vocabulary][:answers_attributes]["2"][:status] == "1" || params[:vocabulary][:answers_attributes]["3"][:status] == "1"
    
        if @vocabulary.update_attributes(vocabulary_params)
          flash[:success] = t "all_changes_reserved"
          redirect_to admin_vocabularies_path
        else
          flash[:danger] = @vocabulary.errors.full_messages
          redirect_back(fallback_location: root_path)
        end
      end
    end
  end

  def destroy
    if @vocabulary.destroy
      flash[:success] = t "vocabulary_deleted"
    else
      flash[:danger] = @vocabulary.errors.full_messages
    end
    redirect_to admin_vocabularies_path
  end

  private

  def vocabulary_params
    params.require(:vocabulary).permit(:name, :description, :lesson_id, :example, answers_attributes: [:content, :status, :id, :_destroy])
  end

  def load_vocabulary
    @vocabulary = Vocabulary.find_by id: params[:id]
    return unless @vocabulary
  end
end
