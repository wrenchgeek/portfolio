Rails.application.routes.draw do

  devise_for :users do
    get "/users/sign_out" => "devise/sessions#destroy", :as => :destroy_user_session
  end
  devise_for :controllers => {registrations: 'users/registrations'}
  root :to => 'home#index'

  resources :skills do
    resources :projects
  end

  resources :posts do
    resources :comments
  end
end
