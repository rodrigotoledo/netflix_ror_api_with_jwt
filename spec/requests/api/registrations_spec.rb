require 'rails_helper'

RSpec.describe 'Api::RegistrationsController', type: :request do
  describe 'POST #create' do
    let(:valid_params) do
      {
        user: attributes_for(:user)
      }
    end

    context 'with valid parameters' do
      it 'creates a new user' do
        post api_registrations_path, params: valid_params
        expect(response).to have_http_status(:created)
        expect(json_response).to have_key('user')
        expect(json_response).to have_key('token')
      end

      it 'returns a JSON response with the new user' do
        post api_registrations_path, params: valid_params
        expect(response).to have_http_status(:created)
        expect(json_response).to have_key('user')
      end
    end

    context 'with invalid parameters' do
      let(:invalid_params) do
        {
          user: attributes_for(:user, email: 'invalid-email')
        }
      end

      it 'does not create a new user' do
        expect do
          post api_registrations_path, params: invalid_params
        end.not_to change(User, :count)
      end

      it 'returns a JSON response with errors' do
        post api_registrations_path, params: invalid_params
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH #update_account' do
    let!(:user) { create(:user) }
    let!(:token) { generate_jwt_token(user) }
    let!(:invalid_token) { generate_invalid_jwt_token }
    let(:valid_params) do
      {
        user: {
          name: 'New Name'
        }
      }
    end

    context 'when user is authenticated' do
      it 'updates the user account' do
        patch update_account_api_registrations_path, params: valid_params, headers: token
        expect(response).to have_http_status(:ok)
        expect(json_response['user']['name']).to eq('New Name')
      end

      it 'dont update user account' do
        patch update_account_api_registrations_path, params: { user: { name: '' } }, headers: token
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'when user is not authenticated' do
      it 'returns unauthorized status' do
        patch update_account_api_registrations_path, params: valid_params
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'with invalid credentials' do
      it 'rescues the error and returns unauthorized' do
        headers = { 'Authorization' => 'Bearer invalid_token' }
        patch update_account_api_registrations_path, headers: headers
        expect(response).to have_http_status(:unauthorized)
      end

      it 'when current_user is invalid' do
        patch update_account_api_registrations_path, headers: invalid_token
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
