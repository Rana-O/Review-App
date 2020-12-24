Rails.application.routes.draw do
  get '/' => 'home#top'
  get 'about' => 'home#about'
  get 'login' => 'users#login_form'
  post 'login' => 'users#login'
  resources :reviews
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
