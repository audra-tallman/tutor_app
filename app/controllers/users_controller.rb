class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    if user.valid?
      redirect_to user_path(user)
    else
      render :new
    end
  end

  def show
    @user = current_user
  end

  private

  def user_params
      params.require(:user).permit(:username, :first_name, :last_name, :student_name, :student_grade, :email, :password, :admin)
  end

end
