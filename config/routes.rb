Rails.application.routes.draw do
  resources :lists, only: %i[new index create show] do
    resources :bookmarks, only: %i[new create]
  end
  resources :bookmarks, only: %i[destroy]

  root to: 'lists#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
