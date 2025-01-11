module Admin
  class TherapistsController < ApplicationController
    before_action :authorize_admin

    def new
      @therapist = Therapist.new
    end

    def create

    end

    def update

    end

    def destroy

    end

    private

    def set_therapist

    end
  end
end
