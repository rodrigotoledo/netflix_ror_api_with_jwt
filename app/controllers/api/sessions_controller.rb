# frozen_string_literal: true

module Api
  class SessionsController < ApplicationController
    before_action :authenticate_user!, only: :destroy
    def create
      user = User.find_by(email: params[:email])
      if user&.authenticate(params[:password])
        token = login(user)
        render json: { user: user.attributes.except('password_digest'), token: token }, status: :created
      else
        head :unprocessable_entity
      end
    end

    def destroy
      logout current_user
      head :no_content
    end
  end
end
