class PagesController < ApplicationController
  def home
    @specialities = Speciality.all
  end
end
