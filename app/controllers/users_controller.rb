class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def create
    user = User.create(user_params)
    if user.save
      redirect_to user_path(user)
    else
      render :new
    end
  end

  def show
    @user = current_user
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to tutors_path
  end

  private

  def user_params
      params.require(:user).permit(:username, :name, :email, :password, :admin, :provider, :uid)
  end

end
