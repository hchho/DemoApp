# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

demo_list = [['a', "A"], ['b', "B"], ['c', "C"]]
demo_list.each do |content, materials|
	Demo.create( content: content, materials: materials)
end

subject_list = [['Physics'] , ['Chemistry'], ['Biology']]
subject_list.each do |topic|
	Subject.create( topic: topic )
end

admin = User.create(name: 'admin', email: 'admin@email.com', password: 'adminadmin', password_confirmation: 'adminadmin', admin: true)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
              email: email,
              password:              password,
              password_confirmation: password)
end