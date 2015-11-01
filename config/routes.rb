Rails.application.routes.draw do

  get 'password_resets/new'

  get 'password_resets/edit'

  root 'static_pages#home'

  get 'help' => 'static_pages#help'
  get 'about' => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get 'timetable' => 'static_pages#timetable'
  get 'signup' => 'users#new'
  get 'mobile' => 'users#mobile'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'


  resources :account_activations, only: [:edit]

  resources :password_resets, only: [:new, :create, :edit, :update]

  resources :timetables, only: [:index, :new, :create, :destroy]


      resources :users # NEW LINE
      resources :projects

  #api
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :create, :show, :update, :destroy] do
      end
      resources :projects, only: [:index, :create, :show, :update, :destroy]
      resources :sessions, only: [:create]
    end
  end


end