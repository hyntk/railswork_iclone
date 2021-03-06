Rails.application.routes.draw do
  get 'sessions/new'
  #patch 'feeds/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources:feeds do
    collection do
      post :confirm
    end
  end

  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :sessions, only: [:new, :create, :destroy]

  resources :favorites, only: [:create, :destroy]

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  root 'feeds#index'
end
