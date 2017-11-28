Rails.application.routes.draw do
    devise_for :users, :controllers => { registrations: 'registrations' }
    
    get 'home/index'
	    
    resources :users do
      resources :items, only: [:create, :new, :destroy]
    end

    root 'home#index'
end
