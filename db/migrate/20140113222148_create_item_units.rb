class CreateItemUnits < ActiveRecord::Migration
  def change
    create_table :item_units do |t|

      t.timestamps
    end
  end
end
