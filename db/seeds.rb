50.times do
  User.create(first_name: Faker::Name.first_name,
   last_name: Faker::Name.last_name,
    username: Faker::Internet.user_name,
     email: Faker::Internet.email(:first_name),
      password: Faker::Internet.password)

end

100.times do
  Tweet.create(body: Faker::Lorem.paragraph, user_id: rand(1..50))
end

