class Item < ActiveRecord::Base
  
  before_validation :make_DetailID
  before_validation :make_CreateDate, on: :create
  before_validation :make_LastUpdate
  # before_validation :make_Values
  
  self.primary_key = :ItemID
  self.table_name = "ICItems"
  
  # needs iyun
  has_many :item_units, :foreign_key => :UMID
  has_many :unit, :through => :item_units
  # end needs iyun
  has_one :sales_code, :foreign_key => :SalesCodeID
  
  validates_uniqueness_of :Item
  
  def make_ItemID
    self.ItemID = Item.count + 1
  end
  
  def make_CreateDate
    self.CreateDate = Time.now
  end
  
  def make_LastUpdate
    self.LastUpdate = Time.now
  end
  
  def available_qty
    r = self.EffectiveOnHandQty - self.BackOrdered - self.Allocated - self.Ordered
    return r.to_int
  end
  
  def unit_of_measure
    ItemUnit.where(ItemID: self.ItemID, UMID: self.UMID).first
  end
  
  def price
    self.EnableDefaultPrice.nil? ? ItemPrice.where(ItemID: self.ItemID, PriceLevelID: PriceLevel.where(DefPrice: true).first.PriceLevelID).Price : self.DefaultPrice
  end
  
  def stocked
    self.StockingCodeID == 1 ? true : false
  end
  
end
