# frozen_string_literal: true

FactoryBot.define do
  factory :review do
    movie { create(:movie) }
    user { create(:user) }
  end
end
