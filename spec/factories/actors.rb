# frozen_string_literal: true

FactoryBot.define do
  factory :actor do
    name { Faker::Name.name_with_middle }
    photo { Faker::Avatar.image }
    info { Faker::Lorem.paragraph }
    designation { 'actor' }
  end
end
