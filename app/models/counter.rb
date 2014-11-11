class Counter < ActiveRecord::Base
  
  self.primary_key = :TableName
  self.table_name = "CoCounters"
  
end
