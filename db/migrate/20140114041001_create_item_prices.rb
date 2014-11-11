class CreateItemPrices < ActiveRecord::Migration
  def change
    create_table :item_prices do |t|

      t.timestamps
    end
  end
end
