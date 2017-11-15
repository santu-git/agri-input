class CreateApplicantProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :applicant_profiles do |t|
      t.string :name
      t.string :mobile_no
      t.string :gender
      t.string :prefer_language
      t.string :id_card_type
      t.string :id_card_number
      t.date :dob
      t.references :applicant_user, foreign_key: true

      t.timestamps
    end
  end
end
