class ApplicationController < ActionController::Base
protect_from_forgery with: :null_session
helper_method :admin_only

  def admin_only
    unless current_user.admin
      flash[:notice] = "You must be an admin to perform that function!"
      redirect_to user_path(current_user)
    end
  end

  def welcome
    @user = current_user
  end

end
