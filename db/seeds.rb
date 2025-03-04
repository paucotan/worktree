# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.create!(
  email: "test@example.com",
  password: "password"
)
Space.create!(
  name: "Modern Co-Working Space",
  location: "123 Innovation Drive, Vancouver, BC",
  price: 75,
  description: "A state-of-the-art workspace with high-speed internet and coffee.",
  user: User.first # Only needed if spaces require a user
)

Space.create!(
  name: "Downtown Shared Office",
  location: "456 Business St, Vancouver, BC",
  price: 60,
  description: "Perfect for freelancers and small teams looking for a professional setting.",
  user: User.first
)
