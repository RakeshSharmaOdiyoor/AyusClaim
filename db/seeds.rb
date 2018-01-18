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

["admin", "staff"].each do |role|
 	Role.create(:name => role) if Role.find_by_name(role).blank?
end

if User.find_by_email("admin@example.com").blank?
  admin_role = Role.find_by_name("admin")
  user = User.create(:username => 'admin', :email=> "admin@example.com",:password => "Password123", :password_confirmation => "Password123")
  user.roles << admin_role
end

Checklist.create(:checklist_name=>"original authorization from suvarna arogya suraksha trust along with district coordinator seal & signature with date")
Checklist.create(:checklist_name=>"claim form & final bill along with patient signature	")
Checklist.create(:checklist_name=>"Pre operative investigation reports")
Checklist.create(:checklist_name=>"Post operative investigation reports	")
Checklist.create(:checklist_name=>"Operative Notes")
Checklist.create(:checklist_name=>"Hospitalizes photo of the patient")
Checklist.create(:checklist_name=>"Discharge Summary")
Checklist.create(:checklist_name=>"Poreuthorization request form")
Checklist.create(:checklist_name=>"Yeshaswini ID card & Cotribution paid receipt")
Checklist.create(:checklist_name=>"Pre-Numbered Credit Bill of the Hospital")
Checklist.create(:checklist_name=>"Implant invoice original Bill(if Applicable) with Bar Code sticker")
Checklist.create(:checklist_name=>"Nil MLC Report(If Applicable)")
Checklist.create(:checklist_name=>"Clinical Photograph(If Applicable)")
Checklist.create(:checklist_name=>"Operative Vedio(If Applicable)")