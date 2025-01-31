module Admin
  class DashboardController < ApplicationController
    before_action :authenticate_therapist!
    before_action :authorize_admin!

    def index
      @therapist = current_therapist
      @therapists = Therapist.all
      @specialities = Speciality.all
      @self_specialities = current_therapist.specialities
      @availabilities = current_therapist.availabilities.includes(:speciality).order("specialities.name").group_by(&:speciality)
      # @appointments = current_therapist.appointments
    end

    private

    def authorize_admin!
      redirect_to root_path, alert: "Accès réservé aux administrateurs." unless current_therapist.admin?
    end
  end
end
