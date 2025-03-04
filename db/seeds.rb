# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Cleaning database..."
Booking.destroy_all
Space.destroy_all
User.destroy_all

puts "Creating users..."

User.create!(
  email: "user1@example.com",
  password: "password123"
)

User.create!(
  email: "user2@example.com",
  password: "password123"
)

# puts "Users created: #{User.count}"

# puts "Creating spaces..."

# spaces = [
#   {
#     name: "Modern Loft Workspace",
#     description: "A stylish and modern co-working space in the heart of the city.",
#     location: "New York, USA",
#     price_per_hour: 15,
#     price_per_day: 100,
#     capacity: 10,
#     availability_status: true,
#     user: owner
#   },
#   {
#     name: "Creative Hub",
#     description: "A vibrant and colorful workspace perfect for designers and artists.",
#     location: "San Francisco, USA",
#     price_per_hour: 20,
#     price_per_day: 130,
#     capacity: 8,
#     availability_status: true,
#     user: owner
#   },
#   {
#     name: "Quiet Work Café",
#     description: "A peaceful co-working spot with great coffee and fast Wi-Fi.",
#     location: "London, UK",
#     price_per_hour: 12,
#     price_per_day: 90,
#     capacity: 6,
#     availability_status: false,
#     user: owner
#   },
#   {
#     name: "Tech Startup Hub",
#     description: "A dynamic space for networking and innovation.",
#     location: "Berlin, Germany",
#     price_per_hour: 18,
#     price_per_day: 120,
#     capacity: 12,
#     availability_status: true,
#     user: owner
#   }
# ]

# spaces.each do |space|
#   Space.create!(space)
# end

# puts "Spaces created: #{Space.count}"

# puts "Creating bookings..."

# Booking.create!(
#   user: renter,
#   space: Space.first,
#   start_date: Date.today + 1,
#   end_date: Date.today + 3,
#   status: "pending"
# )

# Booking.create!(
#   user: renter,
#   space: Space.last,
#   start_date: Date.today + 5,
#   end_date: Date.today + 7,
#   status: "accepted"
# )

# puts "Bookings created: #{Booking.count}"
