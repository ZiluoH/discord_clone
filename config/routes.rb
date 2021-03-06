Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  namespace :api, defaults: {format: :json} do
    resources :users, only: [:create, :show]
    resource :session, only: [:create, :destroy, :show]
    resources :servers, only: [:create, :index, :destroy] do
      resources :channels, only: [:create, :index, :destroy] do
        resources :messages, only: [:create, :index]
      end
    end
    resources :server_memberships, only: [:create, :destroy]
  end

  mount ActionCable.server, at: '/cable'
  root to: 'root#root'

end
