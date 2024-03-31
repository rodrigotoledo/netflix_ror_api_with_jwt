# spec/models/review_spec.rb

require 'rails_helper'

RSpec.describe Review, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:movie) }
  end

  describe 'validations' do
    it { should validate_presence_of(:rating) }
  end
end
