class Booking < ApplicationRecord
  validates :start_date, presence: true
  validates :end_date, presence: true
  # validate :end_date_after_start_date
  belongs_to :space, dependent: :destroy
  belongs_to :renter, class_name: "User"
  has_one :owner, through: :space
end
