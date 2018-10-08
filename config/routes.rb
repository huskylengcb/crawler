Rails.application.routes.draw do
	root to: 'homepages#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :movies
  resources :teleplays
  resources :cartoons
end
