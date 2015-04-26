# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


50.times do
  User.create(first_name: Faker::Name.first_name,
              last_name: Faker::Name.last_name,
              username: Faker::Company.name,
              password: "password",
              profile_picture: Faker::Avatar.image)
        end

15.times do
  Reward.create(name: Faker::Lorem.word,
                description: Faker::Lorem.sentence,
                cost: 2,
                image: Faker::Company.logo)
        end
