# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: 'admin@example.com',
  password: 'somepassword',
  password_confirmation: 'somepassword',
  confirmed_at: Time.now
)

admin_role = Role.create name: 'administrator', description: 'Site administrators'

admin_role.users << user

About.create title: Faker::Lorem.words(number: 5).join("\s"), body: Faker::Lorem.paragraphs(number: 5).join('<br />')

ContactMe.create name: Faker::Name.name, email: Faker::Internet.email, message: Faker::Lorem.paragraphs(number: 5).join('<br />')
