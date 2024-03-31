# spec/models/actor_spec.rb

require 'rails_helper'

RSpec.describe Actor, type: :model do
  describe 'associations' do
    it { should have_many(:actors_movies) }
    it { should have_many(:movies) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:designation) }
  end

  describe 'scopes' do
    describe '.default_scope' do
      it 'returns actors with designation "actor"' do
        actor = create(:actor, designation: 'actor')
        non_actor = create(:actor, designation: 'director')

        expect(Actor.all).to include(actor)
        expect(Actor.all).not_to include(non_actor)
      end
    end
  end

  describe 'friendly_id' do
    it 'should use the name for the slug' do
      actor = create(:actor, name: 'John Doe')
      expect(actor.slug).to eq('john-doe')
    end
  end
end
