Rails.application.routes.draw do
  devise_for :users
  root 'top#index'
  get '/home/about' => 'home#about', as: 'about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books
  resources :users
end
