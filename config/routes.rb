Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config
  root to: 'admin/dashboard#index'

  ActiveAdmin.routes(self)

  namespace :api do
    resource :recomendations, only: [:create]
    resource :users, only:[:login,:create]
    post 'login', to: 'users#login'
  end

end
