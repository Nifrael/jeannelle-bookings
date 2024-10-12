class TherapistsController < ApplicationController
  before_action :set_therapist, only: [:show, :edit, :update, :destroy]

  def index
    @therapists = Therapist.all
    authorize @therapists
  end

  def show
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

  def update
    @therapist.update(therapist_params)
    authorize @therapist
    redirect_to therapist_path(@therapist)
  end

  def edit
    authorize @therapist
  end

  def destroy
    @therapist.destroy
    authorize @therapist
    redirect_to therapists_path
  end

  private

  def therapist_params
    params.require(:therapist).permit(:first_name, :last_name, :email, :role, :password)
  end

  def set_therapist
    @therapist = Therapist.find(params[:id])
  end
end
