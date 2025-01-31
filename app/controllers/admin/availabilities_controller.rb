module Admin
  class AvailabilitiesController < ApplicationController
    before_action :authorize_admin!
    before_action :set_speciality, only: %i[new create edit update destroy]
    before_action :set_availability, only: %i[edit update destroy]
    before_action :authorize_availability, only: [:edit, :update, :destroy]

    def new
      @availability = current_therapist.availabilities.build(speciality_id: @speciality.id)
    end

    def create
      @availability = current_therapist.availabilities.build(availabilities_params)
      if @availability.save
        redirect_to admin_dashboard_index_path, notice: "Disponibilité créée avec succès."
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

    def set_speciality
      if params[:speciality_id].present?
        @speciality = current_therapist.specialities.find_by(id: params[:speciality_id])
        unless @speciality
          redirect_to therapists_dashboard_path, alert: "Vous ne pouvez pas créer de disponibilité pour cette spécialité."
        end
      end
      return @speciality
    end

    def set_availability
      @availability = @therapist.availabilities.find(params[:id])
    end

    def availabilities_params
      params.require(:availability).permit(:date, :start_time, :end_time, :speciality_id)
    end

    def authorize_admin!
      redirect_to root_path, alert: "Accès réservé aux administrateurs." unless current_therapist.admin?
    end

  end
end
