class CreateTherapistSpecialities < ActiveRecord::Migration[7.1]
  def change
    create_table :therapist_specialities do |t|
      t.references :therapist, null: false, foreign_key: true
      t.references :speciality, null: false, foreign_key: true

      t.timestamps
    end
  end
end
