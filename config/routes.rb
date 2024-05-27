Rails.application.routes.draw do
  devise_for :users
  resources :books, only: [:new, :create, :index, :show, :destroy, :edit]
  resources :users, only: [:show, :index, :edit, :update]
  root to: 'homes#top'
  get 'homes/about' => 'homes#about', as: 'about'
  
  # get 'books/new'
  # get 'books/index'
  # get 'books/show'
  # get 'users/:id/show' => 'users#show'
  # get 'users/:id/edit' => 'users#edit'
  # get 'users/index' => 'users#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
