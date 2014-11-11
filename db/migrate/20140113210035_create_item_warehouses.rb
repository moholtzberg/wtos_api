class CreateItemWarehouses < ActiveRecord::Migration
  def change
    create_table :item_warehouses do |t|

      t.timestamps
    end
  end
end
