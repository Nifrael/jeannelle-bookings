class CreateAppointments < ActiveRecord::Migration[7.1]
  def change
    create_table :appointments do |t|
      t.integer :price
      t.references :user, null: false, foreign_key: true
      t.references :availability, null: false, foreign_key: true

      t.timestamps
    end
  end
end
