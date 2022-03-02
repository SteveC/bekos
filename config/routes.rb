Rails.application.routes.draw do
  resource :session, only: %i[show create destroy]
  resource :signup, only: %i[show create]
  
  namespace :user, module: :users do
    resource :settings, only: %i[show update]
  end
  
  get 'login'  => 'sessions#show'
  get 'logout' => 'sessions#destroy'
  get 'chat'   => 'chat#show'
  
  root to: 'chat#show'
end
