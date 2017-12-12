class AddApplicationNumberToAppointments < ActiveRecord::Migration[5.1]
  def change
    add_column :appointments, :application_number, :string
  end
end
