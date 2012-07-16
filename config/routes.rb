GemListing::Application.routes.draw do
  
  devise_for :users
  
  devise_scope :user do
    get "sign_in", :to => "devise/sessions#new"
    get "sign_out", :to => "devise/sessions#destroy"
  end

  root :to => "home#index"
  
  resources :users
  resources :projects
  resources :categories
  resources :components
  
end
