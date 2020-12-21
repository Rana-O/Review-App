Rails.application.routes.draw do
  get '/' => 'home#top'
  get 'about' => 'home#about'
  get 'reviews/index' => 'reviews#index'
  get 'reviews/:id' => 'reviews#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
