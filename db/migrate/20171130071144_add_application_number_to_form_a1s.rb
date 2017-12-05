class AddApplicationNumberToFormA1s < ActiveRecord::Migration[5.1]
  def change
    add_column :form_a1s, :application_number, :string
  end
end
