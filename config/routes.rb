Rails.application.routes.draw do
  Rails.application.routes.default_url_options[:host] = 'XXX'

  devise_for :staffs, path: :staffs, path_names: { sign_in: :login, sign_out: :logout, sign_up: :signup }
  devise_for :users, path: :users, path_names: { sign_in: :login, sign_out: :logout, sign_up: :signup }

  root to: "home#index"

  namespace :staff do
    resources :home
  end

  namespace :user do
    resources :organizations
  end

  namespace :api do
    resources :users
    resources :organizations
  end
end
