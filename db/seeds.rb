# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Rake::Task["db:the_role:admin"].invoke
puts "User role created"

admin = User.create(
						first_name: 'Admin', 
						last_name: 'User', 
						email: 'admin@example.com', 
						password: 'Test!@#$'
					)
admin.activate

puts "Admin user created. Login: admin@example.com Password: Test$%$%$%"

user = User.create(
						first_name: 'Normal', 
						last_name: 'User', 
						email: 'user@example.com', 
						password: 'Test!@#$'
					)
user.activate
puts "Normal user created. Login: user@example.com Password: Test$%$%$%"

admin.role = Role.with_name(:admin)
admin.save!
puts "Assigning admin role to the user: admin@example.com"			

Role.create(
				name: 'user', 
				title: 'Role for normal users', 
				description: 'User can only view own items', 
				the_role: '{"system":{"administrator":false}}'
				)
puts "Creating new role for user."

user.role = Role.with_name(:user)
user.save!
puts "Assigning user role to normal user."