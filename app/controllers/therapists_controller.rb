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
    if @therapist.save
      redirect_to @therapist
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def therapist_params
    params.require(:therapist).permit(:first_name, :last_name, :email, :role, :password)
  end
end
