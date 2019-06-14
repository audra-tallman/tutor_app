require 'pry'
class SubjectsController < ApplicationController

  def index
    @tutors = Tutor.all
     if params[:user_id]
       @subjects = User.find(params[:user_id]).subjects
     else
       @subjects = Subject.all
     end
   end

  # def index
  #   @subjects = Subject.all
  #   @tutors = Tutor.all
  # end

  def create
    subject = Subject.create(user_id: current_user.id, tutor_id: params[:tutor_id])
    redirect_to root_path
  end


end
