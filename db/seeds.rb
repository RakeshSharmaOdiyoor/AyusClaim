# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

["admin", "media_agent","issue"].each do |role|
 	Role.create(:name => role) if Role.find_by_name(role).blank?
end

if User.find_by_email("admin@example.com").blank?
  admin_role = Role.find_by_name("admin")
  user = User.create(:username => 'admin', :email=> "admin@example.com",:password => "Password123", :password_confirmation => "Password123")
  user.roles << admin_role
end
