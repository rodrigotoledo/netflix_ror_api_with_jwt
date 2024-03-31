# frozen_string_literal: true

FactoryBot.define do
  factory :director do
    name { Faker::Name.name_with_middle }
    photo { Faker::Avatar.image }
    info { Faker::Lorem.paragraph }
    designation { 'director' }
  end
end
