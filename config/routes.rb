Achievr::Application.routes.draw do
  devise_for :users

  authenticate :user do
    resources :goals do
      resources :tasks
    end
  end

  get '/home' => 'pages#home'
  get '/about' => 'pages#about'
  get '/contact' => 'pages#contact'
  get '/completed-goals' => 'goals#completed'

  authenticated :user do
    root :to => 'goals#index', :as => :authenticated_root
  end

  root :to => redirect('/home')

end
