Rails.application.routes.draw do
  get "sessions/new"
  get "sessions/create"
  get "sessions/destroy"
  get 'expo' => 'static#expo'
  get "/sitemap.xml", to: "sitemaps#index", defaults: { format: "xml" }
  get 'dashboard' => 'static#dashboard'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get "boba_tea_menu" => "static#boba_tea_menu"
  get "gallery" => "static#gallery"
  get "all_about_sip" => "static#all_about_sip"
  root 'static#index'

  resources :events
  resources :vendors
end