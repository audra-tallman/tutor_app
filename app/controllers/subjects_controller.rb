class SubjectsController < ApplicationController

  def index
    @subjects = Subject.all
    @tutors = Tutor.all
  end

end
