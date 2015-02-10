class Customer < ActiveRecord::Base
  
  before_validation :make_CustomerID, on: :create
  before_validation :make_CreateDate, on: :create
  before_validation :make_LastUpdate
  before_validation :make_Values
  
  self.primary_key = :CustomerID
  self.table_name = "ARCustomers"
  
  scope :active, where(Active: true)
  scope :slaes_rep, lambda {|rep| { :conditions => ["SalesRepID = ?", rep] }}
  
  has_many :equipments, :foreign_key => :CustomerID
  
  # attr_accessible :bill_to_name
  
  def make_CustomerID
    self.CustomerID = Customer.all.last.CustomerID + 1
    self.CustomerNumber = Customer.where("CustomerNumber like (?)", "R10%").last.CustomerNumber.next
  end
  
  def make_CreateDate
    self.CreateDate = Time.now
  end
  
  def make_LastUpdate
    self.LastUpdate = Time.now
  end
  
  def make_Values
    self.CreatorID = "Rails" unless !self.CreatorID.nil?
    self.UpdatorID = "Rails" unless !self.UpdatorID.nil?
    
    self.Active = true unless !self.Active.nil?
    self.Prospect = false unless !self.Prospect.nil?
    
    self.Attn = "" unless !self.Attn.nil?
    self.Address = "" unless !self.Address.nil?
    self.City = "" unless !self.City.nil?
    self.State = "" unless !self.State.nil?
    self.Zip = "" unless !self.Zip.nil?
    self.Country = "" unless !self.Country.nil?
    
    self.Phone1 = "" unless !self.Phone1.nil?
    self.Phone1 = self.Phone1.gsub(/\D/, "").gsub(/(\d{3})(\d{3})(\d{0,4})(\d{0,99})/, '(\1) \2-\3') unless self.Phone1.blank?
    
    self.Phone2 = "" unless !self.Phone2.nil?
    self.Phone2 = self.Phone2.gsub(/\D/, "").gsub(/(\d{3})(\d{3})(\d{0,4})(\d{0,99})/, '(\1) \2-\3') unless self.Phone2.blank?
    
    self.Fax = "" unless !self.Fax.nil?
    self.Fax = self.Fax.gsub(/\D/, "").gsub(/(\d{3})(\d{3})(\d{0,4})(\d{0,99})/, '(\1) \2-\3') unless self.Fax.blank?
    
    self.Email = "" unless !self.Email.nil?
    self.WebSite = "" unless !self.WebSite.nil?
    
    self.Remarks = "" unless !self.Remarks.nil?
    
    self.BlanketPO = "" unless !self.BlanketPO.nil?
    self.PriceLevelID = CoRegValue.where(Name: "ARPriceLevelID", KeyID: 8).first.Value unless !self.PriceLevelID.nil?
    self.TermID = CoRegValue.where(Name: "ARTermID", KeyID: 8).first.Value unless !self.TermID.nil?
    self.ShipMethodID = CoRegValue.where(Name: "ARShipMethodID", KeyID: 8).first.Value unless !self.ShipMethodID.nil?
    self.BranchID = Branch.where(MainBranch: true).first.BranchID unless !self.BranchID.nil?
    self.CreditLimit = 0 unless !self.CreditLimit.nil?
    self.DoFinCharges = false unless !self.DoFinCharges.nil?
    self.EIN = "" unless !self.EIN.nil?
    
    self.TaxNumber = "" unless !self.TaxNumber.nil?
    self.Taxable = true unless !self.Taxable.nil?
  end
  
  def bill_to_name
    self.CustomerName
  end
  
  def bill_to_attn
    self.BillToAttn.blank? && self.UseBillToAddress.blank? ? self.Attn : self.BillToAttn
  end
  
  def bill_to_address
    self.BillToAddress.blank? && self.UseBillToAddress.blank? ? self.Address : self.BillToAddress
  end
  
  def bill_to_city
    self.BillToCity.blank? && self.UseBillToAddress.blank? ? self.City : self.BillToCity
  end
  
  def bill_to_state
    self.BillToState.blank? && self.UseBillToAddress.blank? ? self.State : self.BillToState
  end
  
  def bill_to_zip
    self.BillToZip.blank? && self.UseBillToAddress.blank? ? self.Zip : self.BillToZip
  end
  
  def bill_to_country
    self.BillToCountry.blank? && self.UseBillToAddress.blank? ? self.Country : self.BillToCountry
  end
  
  def dg_customer_id
    self.CustomerID
  end
  
  def dg_customer_number
    self.CustomerNumber
  end
  
  def dg_sales_rep_id
    self.SalesRepID
  end
  
  def dg_last_update
    self.LastUpdate
  end
  
  def customer_name
    self.CustomerName
  end
  
  def customer_address
    self.Address
  end
  
  def customer_city
    self.City
  end
  
  def customer_state
    self.State
  end
  
  def customer_zip
    self.Zip
  end
  
  def customer_phone
    self.Phone1
  end
  
  def customer_fax
    self.Fax
  end
  
  def customer_active
    self.Active
  end
  
  def customer_prospect
    self.Prospect
  end
  

  
end