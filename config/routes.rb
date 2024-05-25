Rails.application.routes.draw do
  get 'users/show'
  get 'users/edit'
  get 'users/index'
  resources :books, only: [:new, :create, :index, :show]
  
  # get 'books/new'
  # get 'books/index'
  # get 'books/show'
  
  devise_for :users
  root to: 'homes#top'
  get '/homes/about' => 'homes#about', as: 'about'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
