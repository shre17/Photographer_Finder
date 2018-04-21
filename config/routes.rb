Rails.application.routes.draw do
  resources :articles, only: [:show, :index]
  
  resources :albums, only: [:show, :index]

  namespace :photographer do 
    resources :articles
    resources :albums do 
      collection do
        post :upload_album_image
      end 
    end
  end

  namespace :admin do 
    resources :articles
    resources :photographers
    resources :users
    resources :membership_plans
    resources :albums do 
      collection do
        post :upload_admin_album_image
      end 
    end
  end
  
  delete '/remove_album_image/:id' => "abulms#remove_album_image"
  delete '/remove_admin_album_image/:id' => "admin_abulms#remove_admin_album_image"
  devise_for :admins, controllers: {
        sessions: 'admins/sessions',
        registration: 'admins/registrations'
      }
  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registration: 'users/registrations'
      }
  devise_for :photographers, controllers: {
        sessions: 'photographers/sessions',
        registration: 'photographers/registrations'
      }
  get 'home/index'
  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
