module TherapistsDashboard
  class DashboardController < ApplicationController
    before_action :authenticate_therapist!

    def index
      @therapists = Therapist.all
      @specialities = current_therapist.specialities
      @therapist = current_therapist
      @availabilities = current_therapist.availabilities
    end
  end
end
