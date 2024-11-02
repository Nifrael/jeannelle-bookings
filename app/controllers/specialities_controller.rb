class SpecialitiesController < ApplicationController

  def show
    @speciality = Speciality.includes(:therapists).find(params[:id])
  end

end
