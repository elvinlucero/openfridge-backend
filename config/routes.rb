Openfridge::Application.routes.draw do
resources :logs

  resources :saved_foods

  resources :shopping_lists

  resources :fridge_foods

  resources :users

  get "home/index"

  root :to => "home#index"

  match "set" => "users#set"

  # Fridge food routes
  match "fridge_foods/push?" => "fridge_foods#push"
  match "fridge_foods/push/:uid/:desc/:year/:month/:day" => "fridge_foods#push"
  match "fridge_foods/update/:id/:desc/:year/:month/:day" => "fridge_foods#update"
  match "fridge_foods/:id/eat" => "fridge_foods#eat"
  match "fridge_foods/:id/throw" => "fridge_foods#throw"
  match "users/:uid/fridge_foods" => "fridge_foods#getfoods"
  
  # Saved food routes
  match "saved_foods/push?" => "saved_foods#push"
  match "saved_foods/push/:uid/:desc/:year/:month/:day" => "saved_foods#push"
 
  # Shopping list routes
  match "shopping_lists/push?" => "shopping_lists#push"
  match "shopping_lists/push/:uid/:desc" => "shopping_lists#push"
  match "users/:uid/shopping_lists" => "shopping_lists#getfoods"
  match "users/:uid/shopping_lists/kill" => "shopping_lists#kill"


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
