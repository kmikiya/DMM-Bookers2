Rails.application.routes.draw do
  get 'users/show'
  get 'users/index'
  devise_for :users
  root to: 'homes#top'
  get 'homes' => 'homes#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books, only: [:index, :edit, :show, :create, :update, :destroy]#controller name
  resources :users, only: [:show, :index, :edit, :update]

end
