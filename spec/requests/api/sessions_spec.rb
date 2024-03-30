# spec/requests/api/sessions_controller_spec.rb

require 'rails_helper'

RSpec.describe 'Api::SessionsController', type: :request do
  describe 'POST #create' do
    context 'with valid credentials' do
      let(:user) { create(:user) }

      it 'creates a new session and returns status 201' do
        post api_signin_path, params: { email: user.email, password: user.password }

        expect(response).to have_http_status(:created)
        expect(JSON.parse(response.body)).to have_key('user')
      end
    end

    context 'with invalid credentials' do
      it 'returns unprocessable_entity status' do
        post api_signin_path, params: { email: 'invalid@example.com', password: 'invalidpassword' }

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'when user is signed in' do
      it 'clears the session and redirects to login_path' do
        user = create(:user, password: 'password', password_confirmation: 'password')
        sign_in_api_with(user, 'password')
        delete api_logout_path
        expect(response).to have_http_status(:no_content)
      end
    end

    context 'when user is not signed in' do
      it 'redirects to root_path' do
        delete api_logout_path
        expect(response).to have_http_status(:no_content)
      end
    end
  end
end
