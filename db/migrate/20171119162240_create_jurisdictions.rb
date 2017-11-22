class CreateJurisdictions < ActiveRecord::Migration[5.1]
  def change
    enable_extension 'hstore' unless extension_enabled?('hstore')
    create_table :jurisdictions do |t|
      t.hstore :name

      t.timestamps
    end
  end
end
