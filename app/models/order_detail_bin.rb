class OrderDetailBin < ActiveRecord::Base
  
  self.primary_keys = :SODetailBinID
  self.table_name = "SOOrderDetailBins"
  
  before_validation :make_SODetailBinID, on: :create
  
  # before_validation :make_Values
  
  def make_SODetailBinID
    self.SODetailBinID = OrderDetailBin.last.SODetailBinID.next
  end
  
end
