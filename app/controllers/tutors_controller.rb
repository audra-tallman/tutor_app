require 'pry'
class TutorsController < ApplicationController

  before_action :find_tutor, only: [:show, :edit, :update]
  before_action :admin_only, except: [:index, :show]

  def index
    if params[:tutor]
      methods = params[:tutor][:methods]
      @tutors = Tutor.send_chain(methods)
    else
      @tutors = Tutor.all
    # @subject_tutor = Tutor.subject(params[:name])
    end
  end

  def new
    @tutor = Tutor.new
  end

  def create
    @tutor = Tutor.create(tutor_params)
    if @tutor.save
      redirect_to tutors_path
    else
      render 'new'
    end
  end

  def show
    @tutor= Tutor.find(params[:id])
    Tutor.subject(params[:name])
  end

  def edit
  end

  def update
    @tutor.update(tutor_params)
    if @tutor.save
      redirect_to tutor_path(@tutor)
    else
      render :edit
    end
  end

  def destroy
    @tutor = Tutor.find(params[:id])
    @tutor.destroy
    redirect_to tutors_path
  end

  private

  def find_tutor
    @tutor = Tutor.find_by(id: params[:id])
  end

  def tutor_params
    params.require(:tutor).permit(:name, :email, :subject, :bio, :gender)
  end

end
