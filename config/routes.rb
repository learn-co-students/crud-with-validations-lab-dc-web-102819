Rails.application.routes.draw do
  resources :songs, only: [:show, :new, :edit, :update, :destroy]
  get '/songs', to: "songs#index", as: "songs"
  post '/songs', to: "songs#create"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
