class CreateSpecialities < ActiveRecord::Migration[7.1]
  def change
    create_table :specialities do |t|
      t.string :name
      t.integer :default_max_attendance

      t.timestamps
    end
  end
end
