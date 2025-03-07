require 'open-uri'

puts "Cleaning database"
User.destroy_all
puts "desroyed users"
Space.destroy_all
Booking.destroy_all

puts "Cleaned database, all good!"

puts "Creating users..."
owner1 = User.create!(email: "owner1@example.com", password: "password123", role: "owner")
owner2 = User.create!(email: "owner2@example.com", password: "password123", role: "owner")
owner3 = User.create!(email: "owner3@example.com", password: "password123", role: "owner")
owner4 = User.create!(email: "owner4@example.com", password: "password123", role: "owner")

renter1 = User.create!(email: "renter1@example.com", password: "password123", role: "renter")
renter2 = User.create!(email: "renter2@example.com", password: "password123", role: "renter")
renter3 = User.create!(email: "renter3@example.com", password: "password123", role: "renter")

puts "Users created: #{User.count}"

puts "Creating spaces..."

image_1 = URI.parse("https://plus.unsplash.com/premium_photo-1670315264879-59cc6b15db5f?q=80&w=3542&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D").open
image_2 = URI.parse("https://images.unsplash.com/photo-1497215728101-856f4ea42174?q=80&w=3540&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D").open
image_3 = URI.parse("https://images.unsplash.com/photo-1497366811353-6870744d04b2?q=80&w=2301&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D").open
image_4 = URI.parse("https://images.unsplash.com/photo-1579487785973-74d2ca7abdd5?q=80&w=3688&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D").open
image_5 = URI.parse("https://images.unsplash.com/photo-1524758631624-e2822e304c36?q=80&w=3540&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D").open
image_6 = URI.parse("https://images.unsplash.com/photo-1604328698692-f76ea9498e76?q=80&w=3000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D").open
image_7 = URI.parse("https://images.unsplash.com/photo-1564069114553-7215e1ff1890?q=80&w=1932&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D").open
image_8 = URI.parse("https://images.unsplash.com/photo-1431540015161-0bf868a2d407?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D").open
image_9 = URI.parse("https://images.unsplash.com/photo-1497366811353-6870744d04b2?q=80&w=2069&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D").open
image_10 = URI.parse("https://images.unsplash.com/photo-1582653291997-079a1c04e5a1?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D").open
image_11 = URI.parse("https://images.unsplash.com/photo-1552793494-111afe03d0ca?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D").open
image_12 = URI.parse("https://images.unsplash.com/photo-1527192491265-7e15c55b1ed2?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D").open

space_images = [image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, image_11, image_12]

space1 = Space.create!(
  name: "Modern Loft Workspace",
  description: "A stylish and modern co-working space in the heart of the city.",
  location: "New York, USA",
  price_per_hour: 15,
  price_per_day: 100,
  capacity: 10,
  availability_status: true,
  owner: owner1
)
space1.photo.attach(io: URI.open(space_images[0]), filename: 'space.jpg', content_type: 'image/jpg')
space1.save!

space2 = Space.create!(
  name: "Creative Hub",
  description: "A vibrant and colorful workspace perfect for designers and artists.",
  location: "San Francisco, USA",
  price_per_hour: 20,
  price_per_day: 130,
  capacity: 8,
  availability_status: true,
  owner: owner2
)
space2.photo.attach(io: URI.open(space_images[1]), filename: 'space.jpg', content_type: 'image/jpg')
space2.save!

space3 = Space.create!(
  name: "Quiet Work Café",
  description: "A peaceful co-working spot with great coffee and fast Wi-Fi.",
  location: "London, UK",
  price_per_hour: 12,
  price_per_day: 90,
  capacity: 6,
  availability_status: true,
  owner: owner1
)
space3.photo.attach(io: URI.open(space_images[2]), filename: 'space.jpg', content_type: 'image/jpg')
space3.save!

space4 = Space.create!(
  name: "Tech Startup Hub",
  description: "A dynamic space for networking and innovation.",
  location: "Berlin, Germany",
  price_per_hour: 18,
  price_per_day: 120,
  capacity: 12,
  availability_status: true,
  owner: owner2
)
space4.photo.attach(io: URI.open(space_images[3]), filename: 'space.jpg', content_type: 'image/jpg')
space4.save!

space5 = Space.create!(
  name: "Rustic Co-Working Barn",
  description: "A unique and rustic workspace in the countryside.",
  location: "Paris, France",
  price_per_hour: 25,
  price_per_day: 150,
  capacity: 10,
  availability_status: true,
  owner: owner1
)
space5.photo.attach(io: URI.open(space_images[4]), filename: 'space.jpg', content_type: 'image/jpg')
space5.save!

space6 = Space.create!(
  name: "Minimalist Office Suite",
  description: "A sleek and minimalist office space with a view of the city.",
  location: "Tokyo, Japan",
  price_per_hour: 22,
  price_per_day: 140,
  capacity: 8,
  availability_status: true,
  owner: owner2
)
space6.photo.attach(io: URI.open(space_images[5]), filename: 'space.jpg', content_type: 'image/jpg')
space6.save!

space7 = Space.create!(
  name: "Industrial Loft Workspace",
  description: "An open and airy loft with exposed brick walls and modern decor.",
  location: "New York, USA",
  price_per_hour: 30,
  price_per_day: 180,
  capacity: 12,
  availability_status: true,
  owner: owner3
)
space7.photo.attach(io: URI.open(space_images[6]), filename: 'space.jpg', content_type: 'image/jpg')
space7.save!

space8 = Space.create!(
  name: "Creative Studio Hub",
  description: "A colorful and inspiring workspace for artists and designers.",
  location: "Berlin, Germany",
  price_per_hour: 25,
  price_per_day: 150,
  capacity: 10,
  availability_status: true,
  owner: owner4
)
space8.photo.attach(io: URI.open(space_images[7]), filename: 'space.jpg', content_type: 'image/jpg')
space8.save!

space9 = Space.create!(
  name: "Skyline Executive Suite",
  description: "A premium office space with floor-to-ceiling windows and a city skyline view.",
  location: "San Francisco, USA",
  price_per_hour: 50,
  price_per_day: 300,
  capacity: 6,
  availability_status: true,
  owner: owner3
)
space9.photo.attach(io: URI.open(space_images[8]), filename: 'space.jpg', content_type: 'image/jpg')
space9.save!

space10 = Space.create!(
  name: "Beachfront Work Retreat",
  description: "A relaxing workspace with ocean views, perfect for deep focus and creativity.",
  location: "Istanbul, Turkey",
  price_per_hour: 35,
  price_per_day: 200,
  capacity: 8,
  availability_status: true,
  owner: owner4
)
space10.photo.attach(io: URI.open(space_images[9]), filename: 'space.jpg', content_type: 'image/jpg')
space10.save!

space11 = Space.create!(
  name: "Tech Startup Hub",
  description: "A dynamic space designed for entrepreneurs and tech teams.",
  location: "Amsterdam, The Netherlands",
  price_per_hour: 28,
  price_per_day: 160,
  capacity: 15,
  availability_status: true,
  owner: owner3
)
space11.photo.attach(io: URI.open(space_images[10]), filename: 'space.jpg', content_type: 'image/jpg')
space11.save!

space12 = Space.create!(
  name: "Mountain Escape Office",
  description: "A peaceful office in the mountains with fresh air and scenic views.",
  location: "Vancouver, Canada",
  price_per_hour: 40,
  price_per_day: 250,
  capacity: 5,
  availability_status: true,
  owner: owner4
)
space12.photo.attach(io: URI.open(space_images[11]), filename: 'space.jpg', content_type: 'image/jpg')
space12.save!

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
