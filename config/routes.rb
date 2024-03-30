Rails.application.routes.draw do
  Sidekiq::Web.use Rack::Auth::Basic do |username, password|
    username == ENV['SIDEKIQ_ADMIN'] && password == ENV['SIDEKIQ_PASSWORD']
  end
  mount Sidekiq::Web => '/sidekiq'
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
