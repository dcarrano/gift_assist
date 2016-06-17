Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :events
      resources :users
      resources :recipients
      resources :gifts
      post '/login', to: 'sessions#create'
      get '/users/current_user', to: 'users#me'
      resources :users, except: [:new, :edit]
    end
  end
end
