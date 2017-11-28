require 'faker'

# Create users

test_users = ['paul_hurrle@yahoo.com', 'paul_nikki@cox.net', 'paulnicolahurrle@gmail.com'] #store test emails inside an array
test_users.each do |user| #Create users with test data
	User.create!(
	first_name: 'Paul',
	last_name: 'Hurrle',
    email: user,
    password: 'password',
    )
end

10.times do #Create users with random data
   User.create!(
	   first_name: Faker::Name.first_name,
	   last_name: Faker::Name.last_name,
       email: Faker::Internet.email,
       password: 'password',
       ) 
end

users = User.all #grabs all users for sampling below

# Create items

25.times do
   item = Item.create!(
       user_id: users.sample.id,
       name: Faker::Movie.quote,
       )
    
    item.update_attribute(:created_at, Faker::Time.between(1.year.ago, Time.now, :all))
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Item.count} items created"