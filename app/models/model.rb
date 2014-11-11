class Model < ActiveRecord::Base
  
  has_many :equipments, :foreign_key => :ModelID
  belongs_to :make, :foreign_key => :MakeID
  
  before_validation :make_CreateDate, on: :create
  before_validation :make_LastUpdate
  
  self.primary_key = :ModelID
  self.table_name = "ICModels"
  
  def make_CreateDate
    self.CreateDate = Time.now
  end
  
  def make_LastUpdate
    self.LastUpdate = Time.now
  end
  
  def dg_model_id
    self.ModelID
  end
  
  def model_make_id
    self.MakeID
  end
  
  def model_number
    self.Model
  end
  
  def model_description
    self.Description
  end
  
  def model_active
    self.Active
  end
  
  def dg_last_update
    self.LastUpdate
  end
  
end
