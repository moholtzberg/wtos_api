class Order < ActiveRecord::Base
  
  has_many :order_details, :foreign_key => :SOID
  
  before_validation :make_SOID, on: :create
  before_validation :make_CreateDate, on: :create
  before_validation :make_LastUpdate
  before_validation :make_DefaultValues
  after_save :update_Counter, on: :create
  after_save :update_SONumber, on: :create
  
  self.primary_key = :SOID
  self.table_name = "SOOrders"
  
  attr_accessor :order_status
  
  def initialize()
    # @order_status = OrderDetailStatus.find(self.DetailStatusID).Description
    @order_status = "some value"
  end
  
  def make_SOID
    self.SOID = Counter.where(TableName: "SOOrders").first.Counter.next
    self.SONumber = CoRegValue.where(KeyID: 11, Name: "O").first.Value.next
  end
  
  def make_CreateDate
    self.CreateDate = Time.now
  end
  
  def make_LastUpdate
    self.LastUpdate = Time.now
  end
  
  def make_DefaultValues
    customer = Customer.find(self.CustomerID)
    self.Date = Time.now unless !self.Date.nil?
    self.ReqDate = Time.now unless !self.ReqDate.nil?
    self.DueDate = Time.now unless !self.DueDate.nil?
    self.CreatorID = "Rails" unless !self.CreatorID.nil?
    self.UpdatorID = "Rails" unless !self.UpdatorID.nil?
    
    self.PONumber = "#{self.PONumber}" unless !customer.RequirePONum.blank? && self.PONumber.blank?
    self.Description = "#{self.Description}"
    self.Remarks = "#{self.Remarks}"
    
    self.BillToID = customer.BillToID unless !self.BillToID.nil?
    self.LocationID = customer.LocationID unless !self.LocationID.nil?
    
    bill_to = Customer.find(self.BillToID);
    self.MailToName = bill_to.bill_to_name unless !self.MailToName.nil?
    self.MailToAddress = bill_to.bill_to_address unless !self.MailToAddress.nil?
    self.MailToAttn = bill_to.bill_to_attn unless !self.MailToAttn.nil?
    self.MailToCity = bill_to.bill_to_city unless !self.MailToCity.nil?
    self.MailToState = bill_to.bill_to_state unless !self.MailToState.nil?
    self.MailToZip = bill_to.Zip unless !self.MailToZip.nil?
    self.MailToCountry = bill_to.Country unless !self.MailToCountry.nil?
    
    ship_to = Customer.find(self.LocationID)
    self.ShipToName = ship_to.CustomerName unless !self.ShipToName.nil?
    self.ShipToAddress = ship_to.Address unless !self.ShipToAddress.nil?
    self.ShipToAttn = ship_to.Attn unless !self.ShipToAttn.nil?
    self.ShipToCity = ship_to.City unless !self.ShipToCity.nil?
    self.ShipToState = ship_to.State unless !self.ShipToState.nil?
    self.ShipToZip = ship_to.Zip unless !self.ShipToZip.nil?
    self.ShipToCountry = ship_to.Country unless !self.ShipToCountry.nil?
    
    self.BranchID = customer.BranchID unless !self.BranchID.nil?
    self.ARBranchID = customer.BranchID unless !self.ARBranchID.nil?
    self.WarehouseID = CoRegValue.where(Name: "FulfillmentWarehouseID").first.Value unless !self.WarehouseID.nil?
    self.OnHold = customer.Hold unless !self.OnHold.nil?
    self.GLID = CoRegValue.where(Name: "ARGLID").first.Value unless !self.GLID.nil?
    self.DiscountRate = 0 unless !self.DiscountRate.nil?
    self.Dicount = 0 unless !self.Discount.nil?
    self.TermDiscountRate = 0 unless !self.TermDiscountRate.nil?
    
    self.Taxable = customer.Taxable unless !self.Taxable.nil?
  end
  
  def update_Counter
    puts "=>>>>>>>>>>>>>>>>>> Calling update_Counter"
    c = Counter.where(TableName: "SOOrders").first
    c.Counter = self.SOID
    c.save
  end
  
  def update_SONumber
    puts "=>>>>>>>>>>>>>>>>>> Calling update_Counter"
    c = CoRegValue.where(KeyID: 11, Name: "O").first
    c.Value = self.SONumber
    c.save
  end
  
  def update_totals
    tot = 0
    qty = 0
    qbo = 0
    self.order_details.each do |od|
      tot = tot + od.Amount
      # puts "total is now => #{tot}"
      qty = qty + od.Quantity
      # puts "quantity is now => #{qty}"
      qbo = qbo+ od.BackOrdered
      # puts "quantity is now => #{qbo}"
    end
    self.Total = tot
    puts "the total is now ==================>>>>>>>>>>> #{self.Total}"
    self.QuantityBackOrdered = qbo
    self.QuantityTotal = qty
    self.save!
    self.update_status
  end
  
  def update_status
    
    full = self.QuantityFulfilled > 0 ? true : false
    ship = self.QuantityShipped > 0 ? true : false
    back = self.QuantityBackOrdered > 0 ? true : false
    
    case 
    when back
      status = self.QuantityTotal > self.QuantityBackOrdered ? 2 : 1
    when ship
      status = self.QuantityTotal > self.QuantityShipped ? 12 : 31
    when full
      status = self.QuantityTotal > self.QuantityFulfilled ? 32 : 81
    else 
      status = 11
    end
    
    self.DetailStatusID = status
    self.save!
  end
  
end
