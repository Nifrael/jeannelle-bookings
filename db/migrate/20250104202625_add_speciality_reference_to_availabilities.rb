class AddSpecialityReferenceToAvailabilities < ActiveRecord::Migration[7.1]
  def change
    add_reference :availabilities, :speciality, foreign_key: true
  end
end
