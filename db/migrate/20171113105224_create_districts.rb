class CreateDistricts < ActiveRecord::Migration[5.1]
  def change
    enable_extension 'hstore' unless extension_enabled?('hstore')
    create_table :districts do |t|
      t.hstore :name
      t.references :state, foreign_key: true

      t.timestamps
    end
  end
end
