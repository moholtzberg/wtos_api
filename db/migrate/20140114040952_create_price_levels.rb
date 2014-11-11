class CreatePriceLevels < ActiveRecord::Migration
  def change
    create_table :price_levels do |t|

      t.timestamps
    end
  end
end
