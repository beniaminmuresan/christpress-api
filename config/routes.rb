Rails.application.routes.draw do
  resources :books, only: [:index, :show] do
    resources :chapters, only: [:index, :show]
  end
end
