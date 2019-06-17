require 'pry'
class SubjectsController < ApplicationController

  def index
    @tutor = Tutor.all
    @subjects = Subject.where("user_id = ?", params[:user_id])
   end

  def create
    @subject = Subject.create(user_id: current_user.id, tutor_id: params[:tutor_id], name: params[:tutor_subject])
    redirect_to user_subjects_path(current_user)
  end


end
