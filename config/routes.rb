Rails.application.routes.draw do
  
  devise_for :users, :skip => :registrations
  root 'posts#index'

  resources :posts, except: [:index]
  resources :projects
  resources :videos
  get 'tags/:tag', to: 'posts#index', as: :tag

end
