Rails.application.routes.draw do
  resources :sessions
  resources :posts do
    post 'confirm' => 'posts#confirm', on: :collection
  end
  resources :users
  resources :nices, only: [:create, :destroy, :index]
  resources :relationships
  resources :conversations do
    resources :messages
  end
end
