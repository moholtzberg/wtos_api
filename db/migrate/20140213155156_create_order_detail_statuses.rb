class CreateOrderDetailStatuses < ActiveRecord::Migration
  def change
    create_table :order_detail_statuses do |t|

      t.timestamps
    end
  end
end
