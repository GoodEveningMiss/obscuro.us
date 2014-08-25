# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# creates new user if one does not already exist in database with email
# adapted from from http://stackoverflow.com/questions/23983370/find-or-create-by-inserting-record-when-validation-fail
def new_user (params)
  user = User.find_or_create_by!(email: params[:email]) do |user|
    user.name     = params[:name] if params[:name]
    user.password = params[:password]
    user.password_confirmation = params[:password_confirmation]
    user.role     = params[:role] || 'registered';
  end
  puts "#{user.role} user found or created: #{user.name}"
end

new_user(name: 'admin', email: 'ideallyhelp@gmail.com', password: 'seniordesign', password_confirmation: 'seniordesign', role: 'admin');
new_user(name: 'connie', email: 'clin269@gmail.com', password: 'whataterriblepassword', password_confirmation: 'whataterriblepassword', role: 'admin');