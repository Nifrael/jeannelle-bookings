class TherapistsController < ApplicationController
  before_action :set_therapist, only: [:show, :edit, :update]
  before_action :authenticate_therapist!
  before_action :authorize_therapist, only: [:show, :edit, :update, :destroy]

  def index
    @therapists = Therapist.all
    authorize @therapists
  end

  def show
  end

  def update
    @therapist.update(therapist_params)
    redirect_to therapist_path(@therapist)
  end

  def edit
  end

  private

  def therapist_params
    params.require(:therapist).permit(:first_name, :last_name, :email, :password)
  end

  def set_therapist
    @therapist = Therapist.find(params[:id])
  end

  def authorize_therapist
    authorize @therapist
  end
end
