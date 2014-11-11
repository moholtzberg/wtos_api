class OrderDetailObserver < ActiveRecord::Observer
  
  def after_save(order_detail)
    puts "==================="
    puts "==> Current Order Total is $#{order_detail.order.Total.to_int}"
    puts "==> Updating Totals On Order Number #{order_detail.order.SONumber}"
    # order_detail.order.update_totals
    Order.find(order_detail.SOID).update_totals
    puts "==> New Order Total is $#{order_detail.order.Total.to_int}"
    puts "==> Finished Updating Totals On Order Number #{order_detail.order.SONumber}"
    puts "==================="
  end
  
  def after_create(order_detail)
    puts "==================="
    puts "==> Creating Bin Allocation on SOOrderDetailBins"
    odb = OrderDetailBin.new
    odb.SOID = order_detail.SOID
    odb.DetailID = order_detail.DetailID
    odb.ItemID = order_detail.ItemID
    odb.ConvFactor = order_detail.ConvFactor
    odb.Quantity = order_detail.Quantity
    odb.WarehouseID = order_detail.order.WarehouseID
    odb.CreatorID = order_detail.CreatorID
    odb.UpdatorID = order_detail.UpdatorID
    odb.CreateDate = order_detail.CreateDate
    odb.LastUpdate = order_detail.LastUpdate
    odb.save
    puts "==================="
  end
  
end