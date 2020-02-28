Rails.application.routes.draw do
  devise_for :users,only: [:registration, :sign_in, :sign_out, :session], :controllers => {
 :registrations => 'users/registrations',
 :sessions => 'users/sessions'
}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, :only => [:show]
  root to: 'toppages#index'
end
