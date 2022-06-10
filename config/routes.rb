Rails.application.routes.draw do
  get '/healthcheck', to: proc { [200, {}, ['success']] }
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    root 'welcome#index'
    get 'welcome/show'    
    resources :jokes, only: [:index, :create]    
    delete 'jokes/:id/like' => 'jokes#destroy_like', as: :destroy_like    
    devise_for :users    
  end
end
