class Unit < ActiveRecord::Base
  
  self.primary_key = :ID
  self.table_name = "ICUnits"
  
  has_many :item_units
  has_many :items, :through => :item_units
  
end
