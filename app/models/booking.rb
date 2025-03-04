class Booking < ApplicationRecord
  belongs_to :space, dependent: :destroy
  belongs_to :renter, class_name: "User"
  has_one :owner, through: :space
end
