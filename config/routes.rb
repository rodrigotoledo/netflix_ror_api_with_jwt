Rails.application.routes.draw do
  namespace :api do
    resource :sessions, only: %i[create destroy]
    resource :registrations, only: [:create]
    resource :movies, only: [:show] do
      collection do
        get 'release', to: 'movies#release'
        get 'top-rated', to: 'movies#top_rated'
      end
    end
  end
end
