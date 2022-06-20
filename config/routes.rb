Rails.application.routes.draw do
  devise_for :users,
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }

  
  namespace 'api' do
    namespace 'v1' do
      resources :users
      patch 'add_role', to: 'restaurants#add_role'
      resources :restaurants

      resources :items
      resources :cartitems
      resources :carts
      
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  
end
