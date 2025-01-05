module Therapist
  class DashboardController < ApplicationController
    before_action :authenticate_therapist!

    def index
      @therapist = current_therapist
      @availabilities = current_therapist.availabilities
    end
  end
end
