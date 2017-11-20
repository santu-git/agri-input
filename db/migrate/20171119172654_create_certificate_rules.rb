class CreateCertificateRules < ActiveRecord::Migration[5.1]
  def change
    create_table :certificate_rules do |t|
      t.references :jurisdiction, foreign_key: true
      t.references :certification_type, foreign_key: true
      t.integer :new_application
      t.integer :certificate_form
      t.integer :renew_application
      t.references :role, foreign_key: true
      t.integer :validity
      t.string :validity_unit
      t.integer :validity_days
      t.timestamps
    end
  end
end
