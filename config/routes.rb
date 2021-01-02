Rails.application.routes.draw do
  get '/' => 'home#top'
  get 'about' => 'home#about'
  get 'login' => 'users#login_form', as: :login
  post 'login' => 'users#login'
  post 'logout' =>'users#logout', as: :logout
  get 'users/:id/likes' => 'users#likes'
  resources :reviews
  resources :users
  resources :likes

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
