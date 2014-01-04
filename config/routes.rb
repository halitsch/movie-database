Moviedatabase::Application.routes.draw do

  resources :movies do
    member do
      get 'participations'
      get 'media'
      get 'recensions'
      get 'websites'
    end
    get 'best_rated', on: :collection
  end

  resources :users do
    member do
      get 'wishes'
      get 'loans'
    end
    get 'wishes_count', on: :collection
    get 'loans_count', on: :collection
  end

  #get 'user/wishes/:id' => 'users#user_wishes', as: 'user_wishes'
  #get 'user/loans/:id' => 'users#user_loans', as: 'user_loans'

  #get 'movie/participation/:id' => 'movies#participation', as: 'participant'
  #get 'movie/media/:id' => 'movies#moviemedia', as: 'moviemedium'
  #get 'movie/recension/:id' => 'movies#movie_recensions', as: 'movie_recensions'
  #get 'movie/websites/:id' => 'movies#websites', as: 'movie_websites'

  resources :wishlists

  resources :loans

  resources :ratings

  resources :websites

  resources :recensions

  resources :media

  resources :movie_participants

  resources :genres do
    get 'count', on: :collection
  end

  resources :comments

  root to: 'static#index'

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
