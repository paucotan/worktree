puts "Cleaning database"
User.destroy_all
puts "desroyed users"
Space.destroy_all
Booking.destroy_all


puts "Cleaned database, all good!"

puts "Creating users..."
@owner = User.create!(email: "owner@example.com", password: "password123", role: "owner")
@renter = User.create!(email: "renter@example.com", password: "password123", role: "renter")
puts "Users created: #{User.count}"

puts "Creating spaces..."

spaces = [
  {
    name: "Modern Loft Workspace",
    description: "A stylish and modern co-working space in the heart of the city.",
    location: "New York, USA",
    price_per_hour: 15,
    price_per_day: 100,
    capacity: 10,
    availability_status: true,
    owner: @owner
  },
  {
    name: "Creative Hub",
    description: "A vibrant and colorful workspace perfect for designers and artists.",
    location: "San Francisco, USA",
    price_per_hour: 20,
    price_per_day: 130,
    capacity: 8,
    availability_status: true,
    owner: @owner
  },
  {
    name: "Quiet Work Café",
    description: "A peaceful co-working spot with great coffee and fast Wi-Fi.",
    location: "London, UK",
    price_per_hour: 12,
    price_per_day: 90,
    capacity: 6,
    availability_status: false,
    owner: @owner
  },
  {
    name: "Tech Startup Hub",
    description: "A dynamic space for networking and innovation.",
    location: "Berlin, Germany",
    price_per_hour: 18,
    price_per_day: 120,
    capacity: 12,
    availability_status: true,
    owner: @owner
  }
]

spaces.each do |space|
  Space.create!(space)
end

puts "Spaces created: #{Space.count}"

puts "Creating bookings..."

Booking.create!(
  renter: User.last,
  space: Space.first,
  start_date: Date.today + 1,
  end_date: Date.today + 3,
  status: "pending"
)

Booking.create!(
  renter: User.last,
  space: Space.last,
  start_date: Date.today + 5,
  end_date: Date.today + 7,
  status: "accepted"
)

puts "Bookings created: #{Booking.count}"
