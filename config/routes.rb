Rails.application.routes.draw do
  get '/' => 'home#top'
  get 'about' => 'home#about'
  resources :reviews

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
