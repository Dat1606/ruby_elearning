class Admin::SessionsController < Admin::AdminBaseController

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == "1" ? remember(user) : forget(user)
      if admin_user?
        flash[:info] = t "welcome_master"
        redirect_to admin_lessons_path
      else
        log_out if logged_in?
        flash[:danger] = t("invalid_login")
        render :new
      end
    else
      flash[:danger] = t("invalid_login")
      render :new
    end
  end

  def new
    if logged_in?
      redirect_to admin_lessons_path
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
