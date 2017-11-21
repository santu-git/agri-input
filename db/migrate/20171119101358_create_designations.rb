class CreateDesignations < ActiveRecord::Migration[5.1]
  def change
    create_table :designations do |t|
      t.references :state, foreign_key: true
      t.references :district, foreign_key: true
      t.references :subdivision, foreign_key: true
      t.references :block, foreign_key: true
      t.references :admin_user, foreign_key: true
      t.references :role, foreign_key: true
      t.date :joining_date
      t.date :ending_date
      t.string :reason
      t.string :status

      t.timestamps
    end
  end
end
