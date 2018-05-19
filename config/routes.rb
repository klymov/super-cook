Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Подключение REST-FULL_контроллера
  resources :items do
    get :upvote,    on: :member
    get :expensive, on: :collection
  end

  get 'items' => 'items'

  get 'items/new'
  get 'items/create' => 'items#create'

  root 'items#index'
  #root to: 'home#index'
end
