class ItemUnit < ActiveRecord::Base
  
  self.table_name = "ICItemUnits"
  
  belongs_to :item, foreign_key: :ItemID
  belongs_to :unit, foreign_key: :UMID
  
  # def unit_of_measure
  #   Unit.where(UMID: self.UMID).TextID
  # end
  
end
