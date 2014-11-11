class PriceLevel < ActiveRecord::Base
  
  self.primary_key = :PriceLevelID
  self.table_name = "ARPriceLevels"
  
end
