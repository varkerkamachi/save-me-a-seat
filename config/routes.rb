SaveMeASeat::Application.routes.draw do
  
  root :to => 'home#index'
  
  resources :reservations
  resources :countries, :only => [:index, :show]
  resources :states, :only => [:index, :show]
  resources :cities, :only => [:index, :show]
  resources :passengers
  resources :locations, :only => [:index, :show]

  namespace :admin do
    resources :cities
    resources :states
    resources :countries
    resources :passengers
  end

end
