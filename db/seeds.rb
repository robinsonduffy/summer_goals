# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

case Rails.env
when "development"
   Kid.create(:name => "Test Kid")
   user = User.create(:email => "test@example.com", :password => "123456", :confirm_password => "123456")
   user.update_attribute(:admin, true)
when "production"
   # do nothing
end
