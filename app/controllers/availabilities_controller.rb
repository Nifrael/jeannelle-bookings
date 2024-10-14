class AvailabilitiesController < ApplicationController
  before_action :set_therapist

  def index
    @availabilities = @therapist.availabilities.where(available: true).includes(:therapist)
  end

  def new
    @availability = @therapist.availabilities.build
  end

  private

  def set_therapist
    @therapist = Therapist.find(params[:therapist_id])
  end

end
