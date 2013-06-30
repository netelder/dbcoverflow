DbcOverflow::Application.routes.draw do
  resources :posts do
    resources :answers
    resources :comments do
      resources :answers
    end
  end

  resources :votes, only: [:create, :update]

  root :to => "posts#index"

  devise_for :users

  get 'users/:id' => 'users#show', as: :user
  get '/about', :to => redirect('/about.html')
end
