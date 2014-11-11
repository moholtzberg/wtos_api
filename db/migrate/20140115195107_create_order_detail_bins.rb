class CreateOrderDetailBins < ActiveRecord::Migration
  def change
    create_table :order_detail_bins do |t|

      t.timestamps
    end
  end
end
