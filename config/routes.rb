Rails.application.routes.draw do
  resources :genres
  resources :favourites
  get 'sessions/new'
	# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
	root "movies#index"

	
	resources :users
	
	resources :movies do
		resources :reviews
		resources :favourites
	end

	get "signup" => "users#new"
	get "signin" => "sessions#new"

	resource :session

end
