Rails.application.routes.draw do
  resource :session, only: %i[show create destroy]
  resource :signup, only: %i[show create]
  
  get 'login'  => 'sessions#show'
  get 'logout' => 'sessions#destroy'
  get 'chat'   => 'chat#show'
end
