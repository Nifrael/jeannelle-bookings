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
Availability.destroy_all

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


rdv1 = Availability.create(
  date: Date.today,
  start_time: "10:00",
  end_time: "12:00",
  therapist: admin,
)

puts "Rendez-vous #{rdv1.date} créé."

rdv2 = Availability.create(
  date: Date.today,
  start_time: "14:00",
  end_time: "16:00",
  therapist: admin,
)

puts "Rendez-vous créé."

rdv3 = Availability.create(
  date: Date.today,
  start_time: "10:00",
  end_time: "12:00",
  therapist: user,
)

puts "Rendez-vous créé."

rdv4 = Availability.create(
  date: Date.today,
  start_time: "10:00",
  end_time: "12:00",
  therapist: admin2,
)

puts "Rendez-vous créé."

rdv5 = Availability.create(
  date: Date.today,
  start_time: "10:00",
  end_time: "12:00",
  therapist: user2,
)

puts "Rendez-vous créé."

rdv6 = Availability.create(
  date: Date.today,
  start_time: "15:00",
  end_time: "17:00",
  therapist: user2,
)

puts "Rendez-vous créé."
