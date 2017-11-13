class CreateMouzas < ActiveRecord::Migration[5.1]
  def change
    enable_extension 'hstore' unless extension_enabled?('hstore')
    create_table :mouzas do |t|
      t.hstore :name
      t.references :block, foreign_key: true

      t.timestamps
    end
  end
end
