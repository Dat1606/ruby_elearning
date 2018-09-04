class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :create_user, :find_courses

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = t "please_log_in"
      redirect_to login_url
    end
  end

  def create_user
    @user = User.new
  end

  def find_courses
    @courses = Course.all
  end
end
