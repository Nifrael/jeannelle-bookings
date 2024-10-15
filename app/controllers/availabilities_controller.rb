class AvailabilitiesController < ApplicationController
  before_action :set_therapist
  before_action :set_availability, only: %i[edit update destroy]

  def index
    @availabilities = @therapist.availabilities.where(available: true).includes(:therapist)
  end

  def new
    @availability = @therapist.availabilities.build
  end

  def create
    @availability = @therapist.availabilities.build(availabilities_params)
    if @availability.save
      redirect_to therapist_availabilities_path(@therapist), notice: "Disponibilité créée avec succès."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @availability.update(availabilities_params)
      redirect_to therapist_availabilities_path(@therapist), notice: 'Disponibilité mise à jour avec succès.'
    else
      render :edit
    end
  end

  def destroy
    @availability.destroy
    redirect_to therapist_availabilities_path(@therapist), notice: 'Disponibilité supprimée avec succès.'
  end

  private

  def set_therapist
    @therapist = Therapist.find(params[:therapist_id])
  end

  def set_availability
    @availability = @therapist.availabilities.find(params[:id])
  end

  def availabilities_params
    params.require(:availability).permit(:date, :start_time, :end_time)
  end

end
