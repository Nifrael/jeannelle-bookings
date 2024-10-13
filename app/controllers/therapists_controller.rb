class TherapistsController < ApplicationController
  before_action :set_therapist, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_therapist!
  before_action :authorize_therapist, only: [:show, :edit, :update, :destroy]

  def index
    @therapists = Therapist.all
    authorize @therapists
  end

  def show
  end

  def new
    @therapist = Therapist.new
    authorize_therapist
  end

  def create
    @therapist = Therapist.new(therapist_params)
    authorize_therapist
    if @therapist.save
      redirect_to @therapist
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @therapist.update(therapist_params)
    redirect_to therapist_path(@therapist)
  end

  def edit
  end

  def destroy
    @therapist.destroy
    redirect_to therapists_path
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
