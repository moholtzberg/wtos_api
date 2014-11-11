class ItemPrice < ActiveRecord::Base
  
  self.primary_key = :ItemPriceID
  self.table_name = "ICItemPrices"
  
end
