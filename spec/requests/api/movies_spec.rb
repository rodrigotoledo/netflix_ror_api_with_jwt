require 'rails_helper'

RSpec.describe Api::MoviesController, type: :request do
  describe 'GET #release' do
    it 'returns a list of recently released movies' do
      create_list(:movie, 15)
      get release_api_movies_path
      expect(response).to have_http_status(:success)
      expect(json_response.size).to eql(10)
    end
  end

  describe 'GET #top_rated' do
    it 'returns a list of top rated movies' do
      create_list(:movie, 20)
      get top_rated_api_movies_path
      expect(response).to have_http_status(:success)
      expect(json_response.size).to eql(15)
    end
  end

  describe 'GET #show' do
    it 'returns details of a specific movie' do
      movie = create(:movie)
      get api_movie_path(movie.slug)
      expect(response).to have_http_status(:success)
      expect(json_response['title']).to eql(movie.title)
    end

    it 'returns nil when movie is not found' do
      get api_movie_path('invalid')
      expect(response).to have_http_status(:success)
      expect(json_response).to be_nil
    end
  end
end
