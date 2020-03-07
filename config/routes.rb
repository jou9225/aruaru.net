Rails.application.routes.draw do
  devise_for :users,only: [:registration, :sign_in, :sign_out, :session], :controllers => {
 :registrations => 'users/registrations',
 :sessions => 'users/sessions'
}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, :only => [:show] do
    member do
      get :likes
    end
  end
      
root to: 'toppages#index'
  
  resources :posts, :only =>[:new,:create,:show] do
    get :search,  on: :collection
  end
  
resources :favorites, only: [:create, :destroy]
  
end
