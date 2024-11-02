class DashboardsController < ApplicationController

  def index
    @therapist = current_therapist
  end
end
