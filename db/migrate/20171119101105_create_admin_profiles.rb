class CreateAdminProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :admin_profiles do |t|
      t.string :name
      t.string :mobile_no
      t.string :gender
      t.string :prefer_language
      t.references :admin_user, foreign_key: true

      t.timestamps
    end
  end
end
