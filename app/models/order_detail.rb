class OrderDetail < ActiveRecord::Base
  
  belongs_to :order, :foreign_key => :SOID
  belongs_to :item, :foreign_key => :ItemID
  
  before_validation :make_DetailID, on: :create
  before_validation :make_CreateDate, on: :create
  before_validation :make_LastUpdate
  before_validation :make_DefaultValues
  after_validation :make_Computations
  
  self.primary_keys = :SOID, :DetailID
  self.table_name = "SOOrderDetails"
  
  def make_DefaultValues
    self.CreatorID = "Rails" unless !self.CreatorID.nil?
    self.UpdatorID = "Rails" unless !self.UpdatorID.nil?
    
    self.BSABillForServices = 0 unless !self.BSABillForServices.nil?
    
    if self.ContractID.nil? && self.EquipmentID.nil?
      self.Bill = true
    else
      self.Bill = Contract.find(self.ContractID).active && !Contract.find(self.ContractID).Bill.blank? ? false : true
    end
    
    self.Description = self.item.Description unless !self.Description.nil?
    
    self.WarehouseID = self.order.WarehouseID unless !self.order.WarehouseID.nil?
    self.UMID = self.item.UMID unless !self.UMID.nil?
      self.UM = self.item.unit_of_measure.unit.TextID
      self.ConvFactor = self.item.unit_of_measure.ConvFactor
      self.GLID = self.item.sales_code.SalesGLID
      self.Stocked = self.item.stocked
    self.Cost = self.item.Cost unless !self.Cost.nil?
    self.Price = self.item.price unless !self.Price.nil?
    self.TaxFlag = self.item.TaxFlag unless !self.TaxFlag.nil?
    
    self.Discount = self.order.Discount unless !self.Discount.nil?
    
  end
  
  def make_Computations
    self.BackOrdered = (self.Quantity > self.item.available_qty) ? self.Quantity - self.item.available_qty : 0
    self.Amount = self.Quantity * self.Price
  end
  
  def make_DetailID
    self.DetailID = OrderDetail.where(SOID: self.SOID).size.next
  end
  
  def make_CreateDate
    self.CreateDate = Time.now
  end
  
  def make_LastUpdate
    self.LastUpdate = Time.now
  end
  
end