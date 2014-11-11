class Contract < ActiveRecord::Base
  
  self.primary_keys = :ContractID
  self.table_name = "SCContracts"
  
  def active
    true
  end
  
end
