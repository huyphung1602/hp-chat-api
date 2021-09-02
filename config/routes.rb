Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  mount ActionCable.server => '/cable'

  namespace :api do
    namespace :v1 do
      resources :messages
      resources :rooms

      post 'sign_up', to: 'users#create'
      post 'login', to: 'sessions#create'
      post 'log_out', to: 'sessions#destroy'
      get 'current_user_info', to: 'sessions#current_user_info'

      namespace :invitation do
        post 'accept', to: 'invitation#accept'
        post 'create', to: 'invitation#create'
      end
    end
  end
end
