class CreateCounters < ActiveRecord::Migration
  def change
    create_table :counters do |t|

      t.timestamps
    end
  end
end
