# spec/requests/api/sessions_controller_spec.rb

require 'rails_helper'

RSpec.describe 'Api::SessionsController', type: :request do
  let!(:user) { create(:user) }
  describe 'POST #create' do
    context 'with valid credentials' do
      it 'creates a new session and returns status 201' do
        post api_sessions_path, params: { email: user.email, password: user.password }

        expect(response).to have_http_status(:created)
        expect(JSON.parse(response.body)).to have_key('user')
      end
    end

    context 'with invalid credentials' do
      it 'returns unprocessable_entity status' do
        post api_sessions_path, params: { email: 'invalid@example.com', password: 'invalidpassword' }

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:token) { generate_jwt_token(user) }
    context 'when user is signed in' do
      it 'clears the session and redirects to login_path' do
        delete api_sessions_path, headers: token
        expect(response).to have_http_status(:no_content)
      end
    end

    context 'when user is not signed in' do
      it 'redirects to root_path' do
        delete api_sessions_path
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
