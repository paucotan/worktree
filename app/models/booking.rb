class Booking < ApplicationRecord
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :status, presence: true
  validate :start_date_is_in_future
  belongs_to :space
  belongs_to :renter, class_name: "User", foreign_key: :renter_id
  has_one :owner, through: :space

  private

  def start_date_is_in_future
    if start_date < Date.today
      errors.add(:start_date, "must be in the future")
    end
  end
end
