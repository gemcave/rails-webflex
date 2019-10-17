Rails.application.routes.draw do
	# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
	root "movies#index"
	get "movies" => "movies#index"
	get "movies/:id" => "movies#show"
end
