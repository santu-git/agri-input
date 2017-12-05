class CreateAppointments < ActiveRecord::Migration[5.1]
  def change
    create_table :appointments do |t|
      t.references :designation, foreign_key: true
      t.references :form_a1, foreign_key: true
      t.datetime :schedule_time
      t.string :status

      t.timestamps
    end
  end
end
