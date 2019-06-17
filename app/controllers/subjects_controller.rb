require 'pry'
class SubjectsController < ApplicationController

  def index
    @subjects = current_user.subjects
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
    @subject = Subject.find(params[:id])
    @subject.destroy
    redirect_to user_subjects_path
  end

end
