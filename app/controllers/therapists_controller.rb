class TherapistsController < ApplicationController

  def index
    @therapists = Therapist.all
    authorize @therapists
  end

  def show
    @therapist = Therapist.find(params[:id])
    authorize @therapist
  end

  def new
    @therapist = Therapist.new
    authorize @therapist
  end

  def create
    @therapist = Therapist.new(therapist_params)
    authorize @therapist
  end

  private

  def therapist_params
    params.require(:therapist).permit(:first_name, :last_name, :email, :role)
  end
end
