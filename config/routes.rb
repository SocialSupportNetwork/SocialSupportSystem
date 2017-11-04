# Guidelines, rules, other pages, etc. tells it where to go
Rails.application.routes.draw do  
  root to: 'home#show'
  
  scope path: 'admin' do
    authenticate :user, lambda { |u| u.admin? } do
      mount RailsEmailPreview::Engine, at: 'emails'
    end
  end
  
  

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show]
  mount Thredded::Engine => '/forum'
  
  # routes for pages
  get "/about" => "static#about"
  get "/advice" => "advice#advice"
  
  get "/displaytips" => "static#displaytips"

  
  
end
