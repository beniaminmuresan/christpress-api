# frozen_string_literal: true

Rails.application.routes.draw do
  resources :bible_reading_plans, only: %i[index show create]
  resources :books, only: %i[index show] do
    resources :chapters, only: %i[index show] do
      resources :verses, only: %i[index show]
    end
  end
  resources :songs, only: %i[index show] do
    resources :song_parts, only: [:index]
  end
end
