# frozen_string_literal: true

module Api
  class MoviesController < ApplicationController
    def release
      movies = Movie.includes(%i[actors director]).order(created_at: :desc).limit(10)
      render json: movies.as_json(include: %i[director actors])
    end

    def top_rated
      movies = Movie.includes(%i[actors director]).order(rating: :desc).limit(15)
      render json: movies.as_json(include: %i[director actors])
    end

    def show
      movie = Movie.friendly.find(params[:id])
      render json: movie.as_json(include: %i[director actors])
    rescue StandardError
      render json: nil
    end
  end
end
