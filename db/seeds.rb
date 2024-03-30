10.times do
  Actor.create!(name: Faker::Name.name_with_middle, info: Faker::Lorem.paragraph, photo: Faker::Avatar.image)
  Director.create!(name: Faker::Name.name_with_middle, info: Faker::Lorem.paragraph, photo: Faker::Avatar.image)
  User.create!(name: Faker::Name.name_with_middle, email: Faker::Internet.email, avatar: Faker::Avatar.image,
               password: 'password123', password_confirmation: 'password123')
end

40.times do
  movie = Movie.create!(
    title: Faker::Movie.title,
    description: Faker::Lorem.paragraph,
    director: Director.order('RANDOM()').first,
    genre: 5.times.map { Faker::Esport.event },
    release_year: rand(2001..2023),
    rating: rand(1..5),
    duration: 120,
    thumbnail: 'https://picsum.photos/1980/1980',
    trailer: 'https://www.youtube.com/watch?v=Ba-kmNb2-Gw'
  )
  movie.actors << Actor.order('RANDOM()').limit(rand(3..5))
  movie.save!
  User.order('RANDOM()').limit(rand(3..5)).each do |user|
    Review.create!(user: user, movie: movie, rating: rand(3..5), comment: Faker::Lorem.paragraph)
  end
end
