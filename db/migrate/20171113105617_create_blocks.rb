class CreateBlocks < ActiveRecord::Migration[5.1]
  def change
    enable_extension 'hstore' unless extension_enabled?('hstore')
    create_table :blocks do |t|
      t.hstore :name
      t.references :subdivision, foreign_key: true

      t.timestamps
    end
  end
end
