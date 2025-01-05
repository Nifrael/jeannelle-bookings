module Admin
  class DashboardsController < ApplicationController
    before_action :authenticate_therapist!
    before_action :authorize_admin!

    def index
      @therapist = current_therapist
      @availabilities = current_therapist.availabilities
      @therapists = Therapist.all
    end

    private

    def authorize_admin!
      redirect_to root_path, alert: "Accès réservé aux administrateurs." unless current_therapist.admin?
    end
  end
end
