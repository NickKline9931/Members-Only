Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  resources :posts, except: [:show]

  root "posts#index"

  devise_scope :user do
    get 'sign_in', to: 'users/sessions#new'
    get 'sign_out', to: 'users/sessions#destroy'
  end

  delete 'posts/:id', to: 'posts#destroy'
  
end
