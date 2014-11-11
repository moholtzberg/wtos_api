class Lease < ActiveRecord::Base
  
  has_many :equipments, :foreign_key => :LeaseID
  belongs_to :customer, :foreign_key => :CustomerID
  belongs_to :leasing_company, :foreign_key => :LeaseCompanyID, :class_name => :customer
  
  self.primary_key = :ContractLeaseID
  self.table_name = "SCContractLeases"
  
  def make_CreateDate
    self.CreateDate = Time.now
  end
  
  def make_LastUpdate
    self.LastUpdate = Time.now
  end
  
  def dg_lease_id
    self.ContractLeaseID
  end
  
  def lease_number
    self.LeaseNumber
  end
  
  def lease_term
    self.Term
  end
  
  def lease_start_date
    self.StartDate
  end
  
  def lease_payment
    self.PaymentAmount
  end
  
  def lease_customer_id
    self.CustomerID
  end
  
  def dg_leasing_company_id
    self.LeaseCompanyID
  end
  
  def dg_last_update
    self.LastUpdate
  end
  
end
