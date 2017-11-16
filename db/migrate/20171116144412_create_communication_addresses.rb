class CreateCommunicationAddresses < ActiveRecord::Migration[5.1]
  def change
    enable_extension 'hstore' unless extension_enabled?('hstore')
    create_table :communication_addresses do |t|
      t.string :street_no
      t.string :post_office
      t.string :police_station
      t.string :pin_code
      t.references :applicant_user, foreign_key: true
      t.references :state, foreign_key: true
      t.references :district, foreign_key: true
      t.string :extended_type
      t.hstore :extended_data

      t.timestamps
    end
  end
end
