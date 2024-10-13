# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Therapist.destroy_all

admin = Therapist.create(
  first_name: "Karine",
  last_name: "Maraval",
  role: "admin",
  email: "test@gmail.com",
  password: "testtest",
)

puts "#{admin.first_name} est créé."

admin2 = Therapist.create(
  first_name: "Julien",
  last_name: "Marchand",
  role: "admin",
  email: "test3@gmail.com",
  password: "testtest",
)

puts "#{admin2.first_name} est créé."

user = Therapist.create(
  first_name: "Test",
  last_name: "Test",
  role: "therapist",
  email: "test2@gmail.com",
  password: "testtest",
)

puts "#{user.first_name} est créé."

user2 = Therapist.create(
  first_name: "Test",
  last_name: "Test",
  role: "therapist",
  email: "test4@gmail.com",
  password: "testtest",
)

puts "#{user2.first_name} est créé."
