# frozen_string_literal: true

FactoryBot.define do
  factory :movie do
    title { Faker::Movie.title }
    description { Faker::Lorem.paragraph }
    genre { 'action' }
    release_year { 2000 }
    director { build(:director) }
    rating { 5 }
    duration { 120 }
    thumbnail { Faker::Avatar.image }
    trailer { 'https://www.youtube.com/watch?v=Ba-kmNb2-Gw' }
  end
end
