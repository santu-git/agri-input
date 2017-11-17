class CreateQualifications < ActiveRecord::Migration[5.1]
  def change
    create_table :qualifications do |t|
      t.string :resource_type
      t.string :resource_name
      t.references :education, foreign_key: true
      t.string :passing_institute
      t.string :passing_year
      t.string :certificate_number
      t.string :status
      t.references :applicant_user, foreign_key: true

      t.timestamps
    end
  end
end
