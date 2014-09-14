Rails.application.routes.draw do
	root :to => 'users#new'
	resources :users do
		resources :photos
	end
	resources :sessions
end
