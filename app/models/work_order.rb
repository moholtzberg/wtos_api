class WorkOrder < ActiveRecord::Base
  
  before_validation :make_WorkOrderlID
  before_validation :make_CreateDate, on: :create
  before_validation :make_LastUpdate
  # before_validation :make_Values
  
  self.primary_key = :WorkOrderID
  self.table_name = "SCWorkOrders"
  
  belongs_to :customer, :foreign_key => :CustomerID
  
  validates_uniqueness_of :Item
  
  def make_WorkOrderlID
    self.WorkORderID = WorkORder.count + 1
  end
  
  def make_CreateDate
    self.CreateDate = Time.now
  end
  
  def make_LastUpdate
    self.LastUpdate = Time.now
  end
  
end
