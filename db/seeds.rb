# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

# Create users
User.create!(
    first_name: 'Paul',
    last_name: 'Hurrle',
    email: 'paul_hurrle@yahoo.com',
    password: 'password',
    )

10.times do
   User.create!(
       first_name: Faker::Name.first_name,
       last_name: Faker::Name.last_name,
       email: Faker::Internet.email,
       password: 'password',
       ) 
end

# Create items
25.times do
   item = Item.create!(
       user_id: User.all.sample.id,
       name: Faker::Movie.quote,
       )
    
    item.update_attribute(:created_at, Faker::Time.between(1.year.ago, Time.now, :all))
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Item.count} items created"