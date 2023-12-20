Rails.application.routes.draw do
  namespace :admin do
    root "dashboards#index"
    resource :dashboard, only: %i[index]
    resources :posts, only: %i[index edit update show destroy]
    resources :users, only: %i[index edit update show destroy]
    get 'login' => 'user_sessions#new'
    post 'login' => "user_sessions#create"
    delete 'logout' => 'user_sessions#destroy'
  end

  root "static_pages#top"
  resources :users, only: %i[new create]
  resource :profiles, only: %i[show edit update]
  resources :posts do
    resources :comments
    collection do
      get 'likes', to: 'posts#likes'
      get 'today', to: 'posts#today'
      get 'baseball', to: 'posts#baseball'
      get 'basketball', to: 'posts#basketball'
      get 'americanfootball', to: 'posts#americanfootball'
      get 'soccer', to: 'posts#soccer'
      get 'others', to: 'posts#others'
    end
  end
  resources :likes, only: %i[create destroy]

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
end
