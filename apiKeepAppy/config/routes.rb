Rails.application.routes.draw do
  
  
  

  match "/signup", :to => "users#create" ,via: [:get,:post]
  match "/login", :to => "sessions#login_attempt", via: [:get,:post]
  match "/logout", :to => "sessions#logout", via: [:get,:post]
  match "/", :to => "sessions#home", via: [:get,:post]
  match "/setting", :to => "sessions#setting", via: [:get,:post]
  
  #root :to => 'sessions#login'

  #resources :sessions do
  #	get 'login_attempt', :on => :collection
  #end

  namespace :api, defaults: {format:'json'} do
  # /api/...  Api::
    namespace :v1 do
      resources :articles

      resources :publicfeeds
    end
    
  end

  resources :quotes

  resources :articles

  #map.connect '/users/new', :controller => 'users' , :action => 'create'
  resources :users do
  #route GET /user/new
  	get 'create', :on => :collection
  end

  resources :publicfeeds
  

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
