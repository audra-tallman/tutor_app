class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:username, :first_name, :last_name, :student_name, :student_grade, :subject, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.requrie(:user).permit(:username, :first_name, :last_name, :student_name, :student_grade, :subject, :email, :password, :password_confirmation)
  end

end
