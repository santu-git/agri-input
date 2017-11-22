class CreateFormA1s < ActiveRecord::Migration[5.1]
  def change
    enable_extension 'hstore' unless extension_enabled?('hstore')
    create_table :form_a1s do |t|
      t.references :role, foreign_key: true
      t.references :place, polymorphic: true
      t.references :state, foreign_key: true
      t.string :applicant_name
      t.string :concern_name
      t.text :postal_address
      t.references :district, foreign_key: true
      t.references :subdivision, foreign_key: true
      t.string :extended_address_type
      t.hstore :extended_address
      t.references :certification_type, foreign_key: true
      t.references :jurisdiction, foreign_key: true
      t.decimal :registration_fees
      t.string :challan_no
      t.date :challan_submission_date
      t.string :bank_name
      t.string :enclose_dd_no
      t.date :enclose_dd_date
      t.string :payment_for
      t.string :payment_drawn_on
      t.string :payment_in_favour_of
      t.string :payable_at
      t.boolean :terms_condition
      t.boolean :declaration
      t.references :applicant_user, foreign_key: true

      t.timestamps
    end
  end
end
