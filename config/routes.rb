Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  namespace :api do
    get 'history', to: 'orders#history'
    resources :orders do
      member do
        post 'ordered'
        post 'delivered'
        post 'new_item'
        post 'delete_item'
      end
    end
    resources :users
    resources :items
  end

  get 'api' => proc { [404, {}, ['Invalid API endpoint']] }
  get 'api/*path' => proc { [404, {}, ['Invalid API endpoint']] }

  root 'home#index'

  #get '*path', to: 'home#index'
end