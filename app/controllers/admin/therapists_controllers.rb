module Admin
  class TherapistsController < ApplicationController
    before_action :authorize_admin!
    before_action :set_therapist, only: [:edit, :update, :destroy]

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

  def set_therapist
    @therapist = Therapist.find(params[:id])
  end

  def authorize_admin!
    redirect_to root_path, alert: "Accès réservé aux administrateurs." unless current_therapist.admin?
  end
  end
end
