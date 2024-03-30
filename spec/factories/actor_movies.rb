# frozen_string_literal: true

FactoryBot.define do
  factory :actor_movie do
    movie { create(:movie) }
    actor { create(:actor) }
  end
end
