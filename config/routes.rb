Achievr::Application.routes.draw do
  devise_for :users

  # You can have the root of your site routed with "root"
  root 'pages#home'

  authenticate :user do
    resources :goals do
      resources :tasks
    end
  end

  get '/home' => 'pages#home'
  get '/about' => 'pages#about'
  get '/contact' => 'pages#contact'
end
