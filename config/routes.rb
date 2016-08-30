Rails.application.routes.draw do
  root to: "projects#new"

  # get '/login', to: "sessions#new", as: "github_login"
  get '/auth/github', as: :github_login
  # get '/', to: "sessions#create", as: "github_login"

  get '/auth/github/callback', to: "sessions#create"
  # get '/auth/oauth/callback', as: "github_login"

  # get 'https://github.com/login/oauth/authorize', to: as: "login_with_gitgub"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
