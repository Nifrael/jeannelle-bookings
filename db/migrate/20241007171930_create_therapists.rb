class CreateTherapists < ActiveRecord::Migration[7.1]
  def change
    create_table :therapists do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password
      t.integer :role

      t.timestamps
    end
  end
end
