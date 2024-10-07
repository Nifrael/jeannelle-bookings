class RemoveEmailAndPasswordFromTherapists < ActiveRecord::Migration[7.1]
  def change
    remove_column :therapists, :email, :string
    remove_column :therapists, :password, :string
  end
end
