class Make < ActiveRecord::Base
  
  has_many :models, :foreign_key => :ModelID
  has_many :equipments, :through => :models
  
  before_validation :make_CreateDate, on: :create
  before_validation :make_LastUpdate
  
  self.primary_key = :MakeID
  self.table_name = "ICMakes"
  
  def make_CreateDate
    self.CreateDate = Time.now
  end
  
  def make_LastUpdate
    self.LastUpdate = Time.now
  end
  
  def dg_make_id
    self.MakeID
  end
  
  def make_name
    self.Make
  end
  
  def make_active
    self.Active
  end
  
  def dg_last_update
    self.LastUpdate
  end
  
end
