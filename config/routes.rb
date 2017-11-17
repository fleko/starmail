Rails.application.routes.draw do
  resources :messages, except: [:update, :show]
  post 'authenticate', to: 'authentication#authenticate'
end
