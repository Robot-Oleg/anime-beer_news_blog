# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create(name: Faker::Name.name, nickname: Faker::Books::Dune.character, password: '123456789', email: Faker::Internet.email)
10.times do
  user.blogposts.new(title: Faker::Books::Dune.title, text: Faker::Books::Dune.quote).save
end