Rails.application.routes.draw do
  root 'welcome#index'
  get 'welcome/show'    
  resources :jokes, only: [:index, :create]
  #route to destroy a like
  delete 'jokes/:id/like' => 'jokes#destroy_like', as: :destroy_like    
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
