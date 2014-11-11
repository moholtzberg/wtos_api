class CreateCoRegValues < ActiveRecord::Migration
  def change
    create_table :co_reg_values do |t|

      t.timestamps
    end
  end
end
