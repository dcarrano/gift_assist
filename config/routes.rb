Rails.application.routes.draw do
  Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :events
      resources :users
      resources :recipients
      resources :gifts
    end
  end
end

end
