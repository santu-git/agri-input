class CreateFormMasters < ActiveRecord::Migration[5.1]
  def change
    create_table :form_masters do |t|
      t.string :name
      t.string :identifier

      t.timestamps
    end
  end
end
