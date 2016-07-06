Rails.application.routes.draw do
  
  resources :tech_listings, path: 'tech/listings'
  get 'tech/flagged' => 'tech_listings#flagged'
  get 'tech/submitted' => 'tech_listings#submitted'
  get 'tech/flagged/remove' => 'tech_listings#remove_flags'

  resources :tech_sites, path: 'tech/sites'
  get 'tech/scrape' => 'tech_sites#scrape'
  get 'tech/rescrape' => 'tech_sites#rescrape'
  get 'tech' => 'tech_sites#dashboard'
  
  get 'discounts/:code' => 'discounts#validate_code'

  get 'working_with_omni_focus/index'

  devise_for :users, controllers: { sessions: "affiliates/sessions", registrations: "affiliates/registrations", confirmations: "affiliates/confirmations", passwords: "affiliates/passwords" }, path: 'affiliates'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  get 'affiliates' => 'affiliates#index'
  get 'update_affiliate_numbers' => 'affiliates#update_affiliate_numbers'

  get 'pay' => 'pay#summary'
  get 'pay/:code' => 'pay#index'
  post 'pay/:code/payment', to: 'pay#payment'

  resources :client_payments

  get 'working-with-omnifocus' => 'working_with_omni_focus#index'
  post 'working-with-omnifocus/buy', to: 'working_with_omni_focus#buy'

  get "/404", :to => "errors#not_found"
  get "/422", :to => "errors#unacceptable"
  get "/500", :to => "errors#internal_error"

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
