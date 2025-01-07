module Admin
  class DashboardController < ApplicationController
    before_action :authenticate_therapist!
    before_action :authorize_admin!

    def index
      @therapist = current_therapist
      @therapists = Therapist.all
      @specialities = Speciality.all
      @availabilities = current_therapist.availabilities
      # @appointments = current_therapist.appointments
    end

    private

    def authorize_admin!
      redirect_to root_path, alert: "Accès réservé aux administrateurs." unless current_therapist.admin?
    end
  end
end
