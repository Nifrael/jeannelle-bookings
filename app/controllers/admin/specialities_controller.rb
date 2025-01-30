module Admin
  class SpecialitiesController < ApplicationController
    before_action :authorize_admin!
    before_action :set_speciality, only: [:edit, :update, :destroy]

    def new
      @speciality = Speciality.new
    end

    def create
      @speciality = Speciality.new(speciality_params)
      if @speciality.save
        redirect_to @speciality
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
    end

    def update
      if @speciality.update(speciality_params)
      redirect_to admin_dashboard_index_path, notice: "Spécialité mis à jour avec succès."
      else
        render :edit, alert: "Erreur : #{@speciality.errors.full_messages.join(', ')}"
      end
    end

    def destroy

    end


    private

    def set_speciality
      @speciality = Speciality.find(params[:id])
    end

    def speciality_params
      params.require(:speciality).permit(:name, :default_max_attendance, therapist_ids: [])
    end

    def authorize_admin!
      redirect_to root_path, alert: "Accès réservé aux administrateurs." unless current_therapist.admin?
    end

  end
end
