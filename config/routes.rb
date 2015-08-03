Rails.application.routes.draw do
  
  devise_for :users, :skip => :registrations
  root 'static_pages#root'

  resources :posts
  resources :projects
  resources :videos
  get 'tags/:tag', to: 'posts#index', as: :tag
  get 'contact', to: 'static_pages#contact'

end
