Rails.application.routes.draw do
  resource :session, only: %i[show create destroy]
  
  get 'login'  => 'sessions#show'
  get 'logout' => 'sessions#destroy'
  get 'chat'   => 'chat#show'
end
