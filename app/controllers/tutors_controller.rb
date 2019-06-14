require 'pry'
class TutorsController < ApplicationController

  before_action :find_attraction, only: [:show, :edit, :update]
  before_action :admin_only, except: [:index, :show]

  def index
    @tutors = Tutor.all
  end

  def new
    @tutor = Tutor.new
  end

  def create
    @tutor = Tutor.create(tutor_params)
    if @tutor
      redirect_to_tutor_path(@tutor)
    else
      render 'new'
    end
  end

  def show
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

  private

  def find_tutor
    @tutor = Tutor.find_by(id: params[:id])
  end

  def tutor_params
    params.require(:tutor).permit(:name, :email, :subject, :bio)
  end

end
