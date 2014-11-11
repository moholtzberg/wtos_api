class Inventory < ActiveRecord::Base
  
  self.primary_key = :LookUpID
  self.table_name = "ICInventory"
  
end
