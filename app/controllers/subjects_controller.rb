require 'pry'
class SubjectsController < ApplicationController

  def index
    # @user_subjects = current_user.subjects
    @subjects = Subject.all
    @user_id = current_user.id

  end

  def create
    @subject = Subject.create(user_id: current_user.id, tutor_id: params[:tutor_id], name: params[:tutor_subject])
    redirect_to user_subjects_path(current_user)
  end

  def show
    @subject_name = subject_path.slice(10...)
    @subject_tutors = Tutor.subject(@subject_name)
  end

  def destroy
    @subjects = Subject.find(params[:id])
    @subjects.delete
    redirect_to user_subjects_path
  end

end
