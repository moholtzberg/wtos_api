class CreateSalesCodes < ActiveRecord::Migration
  def change
    create_table :sales_codes do |t|

      t.timestamps
    end
  end
end
