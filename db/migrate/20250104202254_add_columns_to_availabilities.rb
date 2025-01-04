class AddColumnsToAvailabilities < ActiveRecord::Migration[7.1]
  def change
    add_column :availabilities, :current_attendance, :integer
    add_column :availabilities, :max_attendance, :integer
  end
end
