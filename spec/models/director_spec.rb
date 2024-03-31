# spec/models/director_spec.rb

require 'rails_helper'

RSpec.describe Director, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:designation) }
  end

  describe 'scopes' do
    describe '.default_scope' do
      it 'returns directors with designation "director"' do
        director = create(:director, designation: 'director')
        non_director = create(:director, designation: 'actor')

        expect(Director.all).to include(director)
        expect(Director.all).not_to include(non_director)
      end
    end
  end

  describe 'friendly_id' do
    it 'should use the name for the slug' do
      director = create(:director, name: 'Jane Doe')
      expect(director.slug).to eq('jane-doe')
    end
  end
end
