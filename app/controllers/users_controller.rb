class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update]
  before_action :calculate_point, only: [:edit, :show]
  before_action :logged_in_user, only: [:edit , :update, :destroy]
  before_action :admin_user, only: :destroy

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:success] = t "greeting"
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def show
    @user_lessons = UserLesson.find_by_user @user.id
  end

  def edit
    unless @user
      flash[:danger] = t "user_not_found"
      redirect_to users_url
    end
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = t "profile_updated"
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = t "user_deleted"
    else
      flash[:danger] = @user.errors.full_messages
    end
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar)
  end

  def correct_user
    @user = User.find_by id: params[:id]
    return if current_user?(@user)
    flash[:danger] = t "user_not_found"
    redirect_to root_path
  end

  def calculate_point
    @user = User.find_by id: params[:id]
    return unless @user
    # Return current user's point
    @user_point = (UserLesson.where(user_id: @user.id)).pluck(:point).inject(0){|sum,x| sum + x }
  end
end
