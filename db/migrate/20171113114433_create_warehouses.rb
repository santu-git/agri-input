class CreateWarehouses < ActiveRecord::Migration[5.1]
  def change
    create_table :warehouses do |t|
      t.string :name
      t.string :owner_name
      t.references :state, foreign_key: true
      t.references :district, foreign_key: true
      t.string :post_office
      t.string :police_station
      t.string :pincode
      t.text :postal_address
      t.references :applicant_user, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
