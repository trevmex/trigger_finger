Rails.application.routes.draw do
  devise_for :hackers, :controllers => { :omniauth_callbacks => "hackers/omniauth_callbacks" }

  get 'device/index'

  root 'device#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
