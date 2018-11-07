Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :projects do
    resources :tasks
  end

  root "projects#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
