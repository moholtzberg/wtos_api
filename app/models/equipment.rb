class Equipment < ActiveRecord::Base
  include ActiveModel::Serializers::JSON
  
  belongs_to :model, :foreign_key => :ModelID
  
  self.primary_key = :EquipmentID
  self.table_name = "SCEquipments"
  
  def make_CreateDate
    self.CreateDate = Time.now
  end
  
  def make_LastUpdate
    self.LastUpdate = Time.now
  end
  
  def dg_equipment_id
    self.EquipmentID
  end
  
  def dg_customer_id
    self.CustomerID
  end
  
  def equipment_model_id
    self.ModelID
  end
  
  def equipment_number
    self.EquipmentNumber
  end
  
  def equipment_serial
    self.SerialNumber
  end
  
  def equipment_customer_id
    self.CustomerID
  end
  
  def equipment_lease_id
    self.LeaseID
  end
  
  def equipment_install_date
    self.InstallDate
  end
  
  def dg_last_update
    self.LastUpdate
  end
  
end
