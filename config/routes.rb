Rails.application.routes.draw do
  resources :songs, except: [:index, :create]
  get '/', to: 'songs#index', as: 'songs'
  post '/songs', to: 'songs#create'
end
