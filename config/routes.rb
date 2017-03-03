Rails.application.routes.draw do
  get '/' => 'home#top'
  get 'about' => 'home#about'

  get 'login' => 'users#login_form'
  get 'signup' => 'users#new'
  get 'users/:id/edit' => 'users#edit'
  get 'users/:id/edit_password' => 'users#edit_password'
  get 'users/:id/likes' => 'users#likes'
  get 'users/:id' => 'users#show'
  post 'users/create' => 'users#create'
  post 'login' => 'users#login'
  post 'logout' => 'users#logout'
  post 'users/:id/update' => 'users#update'
  post 'users/:id/update_password' => 'users#update_password'

  get 'posts/index' => 'posts#index'
  get 'posts/new' => 'posts#new'
  get 'posts/:id/edit' => 'posts#edit'
  get 'posts/:id' => 'posts#show'
  post 'posts/create' => 'posts#create'
  post 'posts/:id/update' => 'posts#update'
  post 'posts/:id/destroy' => 'posts#destroy'

  post '/likes/:post_id/create' => 'likes#create'
  post '/likes/:post_id/destroy' => 'likes#destroy'
end
