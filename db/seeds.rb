# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

good_number = 20

good_number.times do |i|
  Good.create(name: Faker::Food.dish,
              price: rand(10..2000),
              quantity: rand(1..10),
              description: Faker::Food.description)
  puts "Good created: #{i + 1}/#{good_number}"
end