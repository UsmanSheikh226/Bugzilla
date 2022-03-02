Rails.application.routes.draw do

  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
  end
  
  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
  root "projects#index"
  resources :users
  resources :projects
  resources :bugs do
    resources :comments
  end
  
  

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
