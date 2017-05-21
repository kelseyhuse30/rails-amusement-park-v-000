Rails.application.routes.draw do

	root :to => "sessions#welcome"

	resources :users, :attractions

	get '/signin', to: "sessions#new"
	post '/signin', to: "sessions#create"
	delete '/signout', to: "sessions#destroy"

	post "/rides/new", to: "rides#new"

end