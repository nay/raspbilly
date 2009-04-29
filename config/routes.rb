ActionController::Routing::Routes.draw do |map|
  map.resources :numbering_rules

  map.resources :numbering_reset_types

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  map.new_bill_sale_items "bills/new/sale_items", :controller => "bills", :action => "add_sale_item_field"
  map.bill_sale_items "bills/:id/sale_items", :controller => "bills", :action => "add_sale_item_field"
  map.new_bill_out_of_pocket_items "bills/new/out_of_pocket_items", :controller => "bills", :action => "add_out_of_pocket_item_field"
  map.bill_out_of_pocket_items "bills/:id/out_of_pocket_items", :controller => "bills", :action => "add_out_of_pocket_item_field"
  map.bills_dhtmlxgrid "bills/dhtmlxgrid.:format", :controller => "bills", :action => "dhtmlxgrid"
  map.resources :bills
  

  map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
