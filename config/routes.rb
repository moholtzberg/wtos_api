WtosApi::Application.routes.draw do
  
  resources :order_detail_statuses


  resources :order_detail_bins


  resources :contracts


  resources :item_prices


  resources :price_levels


  resources :sales_codes


  resources :item_units


  resources :units


  resources :item_warehouses


  resources :inventories


  resources :co_reg_values


  resources :counters


  resources :items


  resources :order_datails


  resources :branches


  resources :orders


  resources :customers


  resources :equipments


  resources :leases
  
  resources :models
  
  resources :makes
end
