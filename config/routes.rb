Diploma::Application.routes.draw do

  get 'chat' => 'chat#index'
  post 'chat/create' => 'chat#create'
  get 'chat/showlast'
  get 'chat/update/:from' => 'chat#update'
  get 'chat/:id' => 'chat#show'
  
  get 'gallery/add'
  get "gallery" => 'gallery#showall'
  get "gallery/user/(:user)" => 'gallery#showall'
  post 'gallery' => 'gallery#create'
  get 'gallery/search'
  post 'gallery/search' => 'gallery#find'
  get 'gallery/:id' => 'gallery#show'
  delete 'gallery/:id' => 'gallery#delete'

  get 'news' => 'news#showall'
  get 'news/add'
  get 'news/:id' => 'news#show'
  get 'news/:id/edit' => 'news#edit'
  post 'news' => 'news#create'

  get 'login' => "auth#login"
  get 'logout' => "sessions#destroy"
  get 'register' => "auth#register"
  post 'login' => 'sessions#create'

  get "users/add"
  get "users" => "users#showall"
  get 'users/:id/edit' => 'users#edit'
  delete "users/:id" => "users#delete"
  get "/users/:id" => "users#show", :as => :user
  post "users" => 'users#create'
  put "users/:id" => 'users#update'

  get "index/index"
  
  root :controller => 'index', :action => 'index'

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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  #match ':controller(/:action(/:id))(.:format)'
end
