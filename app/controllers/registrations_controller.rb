class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:username, :name, :email, :password, :password_confirmation, :admin, :provider, :uid)
  end

  def account_update_params
    params.require(:user).permit(:username, :name, :email, :password, :password_confirmation, :current_password, :admin, :provider, :uid)
  end

end
