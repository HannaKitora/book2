Rails.application.routes.draw do
  devise_for :users
  # get 'users/:id/show' => 'users#show'
  # get 'users/:id/edit' => 'users#edit'
  # get 'users/index' => 'users#index'
  resources :books, only: [:new, :create, :index, :show, :destroy, :edit]
  resources :users, only: [:show, :index, :edit, :update]
  
  # get 'books/new'
  # get 'books/index'
  # get 'books/show'
  

  root to: 'homes#top'
  get '/homes/about' => 'homes#about', as: 'about'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
