Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
   root "events#index"

   resources :events do
    resources :event_attendings, only: %i[create destroy]
  end
   resources :users, only: [:show]
   

  # Defines the root path route ("/")
  # root "articles#index"
end
