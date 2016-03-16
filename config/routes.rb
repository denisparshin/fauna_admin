Rails.application.routes.draw do

  devise_for :users, defaults: { format: :json }, controllers: { sessions: "api/users/sessions", registrations: "api/users/registrations" }

  if Rails.env.development?
    match '/stubs/*path', to: 'stubs#show', via: :get
  end

  root 'pages#index'

  namespace :api, defaults: { format: :json } do
    resources :products
    resources :catalogs
    resources :categories
    resources :sub_products
    resources :filter_groups
  end

end
