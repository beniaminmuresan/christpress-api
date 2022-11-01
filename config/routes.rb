Rails.application.routes.draw do
  resources :books, only: [:index, :show] do
    resources :chapters, only: [:index, :show] do
      resources :verses, only: [:index, :show]
    end
  end

  resources :songs, only: [:index, :show] do
    resources :song_parts, only: [:index]
  end
end
