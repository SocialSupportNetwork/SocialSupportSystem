# Guidelines, rules, other pages, etc. tells it where to go
Rails.application.routes.draw do  
  # get 'tips/index'

  # get 'tips/new'

  # get 'tips/create'

  # get 'tips/show'

  root to: 'home#show'
  get "/about" => "static#about"
  get "/contact" => "static#contact"
  get "/info" => "static#info"
  scope path: 'admin' do
    authenticate :user, lambda { |u| u.admin? } do
      mount RailsEmailPreview::Engine, at: 'emails'
    end
  end
  
  

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show]
  mount Thredded::Engine => '/forum'
  
  # added by Billy, look into mount format
  resources :tips
  
  # match '/contacts',     to: 'contacts#new', via: 'get'
  # resources "contacts", only: [:new, :create]
  
  resources :contacts
  
  
end
