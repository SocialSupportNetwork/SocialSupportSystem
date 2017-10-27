# Guidelines, rules, other pages, etc. tells it where to go
Rails.application.routes.draw do  
  root to: 'home#show'
  get "/:page" => "static#show"
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
end
