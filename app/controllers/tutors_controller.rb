class TutorsController < ApplicationController

  before_action :find_tutor, only: [:show, :edit, :update]
  # before_action :admin_only, except: [:index, :show]

  def index
    if params[:tutor]
      methods = params[:tutor][:methods]
      @tutors = Tutor.send_chain(methods)
    else
      @tutors = Tutor.all
      respond_to do |f|
        f.html {render :index}
        f.json {render json: @tutors}
      end
    end
  end

  def new
    @tutor = Tutor.new
  end

  def create
    tutor = Tutor.create(tutor_params)
    if tutor.save
        render json: tutor
    else
      puts "handle error"
    end
  end

  def show
    @tutor= Tutor.find(params[:id])
    Tutor.subject(params[:name])
    respond_to do |f|
      f.html {render :show}
      f.json {render json: @tutor}
    end
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
