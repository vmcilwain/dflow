# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  root "pages#index"

  devise_for :users

  get :about, as: :about, to: "pages#about"
  resources :abouts, only: %i[new create edit update]
end
