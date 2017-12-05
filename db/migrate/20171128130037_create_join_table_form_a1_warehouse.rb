class CreateJoinTableFormA1Warehouse < ActiveRecord::Migration[5.1]
  def change
    create_join_table :form_a1s, :warehouses do |t|
      t.index [:form_a1_id, :warehouse_id]
      # t.index [:warehouse_id, :form_a1_id]
    end
  end
end
