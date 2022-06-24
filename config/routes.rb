Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
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
      resources :reviews
      resources :orders
      resources :examples
      resources :deliveries
      
    end  
  end

  devise_scope :user do
    get "users/res_owner_show" => "users/sessions#res_owner_show"
    get "users/admin" => "users/sessions#admin"
  end
  
end
