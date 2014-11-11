class CreateOrderDatails < ActiveRecord::Migration
  def change
    create_table :order_datails do |t|

      t.timestamps
    end
  end
end
