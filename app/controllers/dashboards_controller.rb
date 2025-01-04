class DashboardsController < ApplicationController

  def index
    @therapist = current_therapist
    @availabilities = current_therapist.availabilities
  end
end
