require 'pry'
class SubjectsController < ApplicationController

  def index
    user = User.find(params[:user_id])
    @subjects = user.subjects
 end

  def create
    @subject = Subject.create(user_id: current_user.id, tutor_id: params[:tutor_id], name: params[:tutor_subject])
    redirect_to user_subjects_path(current_user)
  end


end
