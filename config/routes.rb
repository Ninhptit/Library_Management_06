Rails.application.routes.draw do
  namespace :admin do
    get 'users/index'
  end

  devise_for :users
  root "static_pages#home"
  resource :static_page
end
