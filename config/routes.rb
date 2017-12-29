Rails.application.routes.draw do

  devise_for :users

  resources :listings, :members 

  root "home#index"

end
