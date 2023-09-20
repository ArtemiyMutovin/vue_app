Rails.application.routes.draw do
  devise_for :staffs, path: :staffs, path_names: { sign_in: :login, sign_out: :logout, sign_up: :signup }
  devise_for :users, path: :users, path_names: { sign_in: :login, sign_out: :logout, sign_up: :signup }

  root to: "home#index"

  namespace :staff do
    resources :home
  end
end
