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

admin = User.create(name: 'admin', email: 'admin@email.com', password: 'admin', password_confirmation: 'admin')