Rails.application.routes.draw do
  
  devise_for :users, :skip => :registrations
  root 'posts#index'

  resources :posts, except: [:index]
  resources :videos

end
