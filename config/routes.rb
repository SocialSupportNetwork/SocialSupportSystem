# Guidelines, rules, other pages, etc. tells it where to go
Rails.application.routes.draw do  

  root to: 'home#show'
  get "/about" => "static#about"
  get "/contact" => "static#contact"
  get "/info" => "static#info"
  get "/terms" => "static#terms"
  get "/privacy" => "static#privacy"
  
  scope path: 'admin' do
    authenticate :user, lambda { |u| u.admin? } do
      mount RailsEmailPreview::Engine, at: 'emails'
    end
  end

  get '/users/block/:id' => 'users#block_user'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show]
  mount Thredded::Engine => '/forum'

  resources :tips
  
  match '/contacts',     to: 'contacts#new', via: 'get'
  resources "contacts", only: [:new, :create]
  
end
