class AvailabilitiesController < ApplicationController
  before_action :set_therapist

  def index
    @availabilities = @therapist.availabilities.where(available: true).includes(:therapist)
  end

  private

  def set_therapist
    @therapist = Therapist.find(params[:therapist_id])
  end

end
