RestoreTheChiefApp::Application.routes.draw do
  resources :site_setups


  resources :posts


  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
 
  
 # match 'contact' => 'contact#new', :as => 'contact', :via => :get
  match 'contact' => 'contact#create', :as => 'contact', :via => :post
  
  devise_scope :user do
      root :to => "home#index" #root :to => "devise/registrations#new"
    match '/user/confirmation' => 'confirmations#update', :via => :put, :as => :update_user_confirmation
  end
 devise_for :users, :controllers => { :registrations => "registrations", :confirmations => "confirmations" }
  match 'users/bulk_invite/:quantity' => 'users#bulk_invite', :via => :get, :as => :bulk_invite
  resources :users do
    get 'invite', :on => :member
  end
  
  
end