# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



admin = User.create(name: 'admin', email: 'admin@email.com', password: 'adminadmin', password_confirmation: 'adminadmin', admin: true)

9.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@example.com"
  password = "password"
  User.create!(name:  name,
              email: email,
              password:              password,
              password_confirmation: password)
end

physics = Subject.create(topic: 'physics')
biology = Subject.create(topic: 'biology')
chemistry = Subject.create(topic: 'chemistry')

demo_list = [["First", 'a', "A", 1, 1], ["Second", 'b', "B", 2, 1], ["Third", 'c', "C", 3, 1]]
demo_list.each do |name, content, materials, subject, user|
	Demo.create( name: name, content: content, materials: materials, subject_id: subject, user_id: user)
end

best_demo = Demo.create( name: "Best", content: 'best one', materials: "misc", subject_id: 1, user_id: 1, rating_average: 4.5)