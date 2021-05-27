Rails.application.routes.draw do
  resources :entry_items 
  resources :user_notes
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :show]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
    end
  end
end
