Rails.application.routes.draw do
  devise_for :hackers
  get 'device/index'

  root 'device#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
