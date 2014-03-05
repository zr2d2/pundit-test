PunditTest::Application.routes.draw do
  get  '/auth/failure'       => 'sessions#failure'
  get  '/auth/saml/metadata' => 'sessions#metadata'
  post '/auth/saml/callback' => 'sessions#create'
  get  '/auth/saml/callback' => 'sessions#create' if Rails.env.test?
  get  '/auth/saml/destroy'  => 'sessions#destroy', :as => 'logout'

  # replace with real actions
  get '/internal' => 'root#internal'  # requires login

  resources :emails

  root :to => 'root#index'
end
