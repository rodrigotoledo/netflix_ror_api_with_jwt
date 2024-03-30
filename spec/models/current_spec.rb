# spec/models/current_spec.rb

require 'rails_helper'

RSpec.describe Current, type: :model do
  describe 'attributes' do
    it 'allows setting and getting the user attribute' do
      user = create(:user)
      Current.user = user
      expect(Current.user).to eq(user)
    end
  end
end
