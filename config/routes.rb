Rails.application.routes.draw do
  get 'login' => 'users#login_form'
  get 'signup' => 'users#new'
  get 'edit_profile' => 'users#edit_profile'
  get 'edit_password' => 'users#edit_password'
  get 'users/:id' => 'users#show'
  post 'users/create' => 'users#create'
  post 'login' => 'users#login'
  post 'logout' => 'users#logout'
  post 'update_profile' => 'users#update_profile'
  post 'update_password' => 'users#update_password'

  get 'posts/index' => 'posts#index'
  get 'posts/new' => 'posts#new'
  get 'posts/:id/edit' => 'posts#edit'
  get 'posts/:id' => 'posts#show'
  post 'posts/create' => 'posts#create'
  post 'posts/:id/update' => 'posts#update'
  post 'posts/:id/destroy' => 'posts#destroy'

  get '/' => 'home#top'
  get 'about' => 'home#about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
