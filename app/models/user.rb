class User < ApplicationRecord
  before_validation :set_default_role, on: :create
  # has_many: bookings
  # has_many
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :spaces, dependent: :destroy, foreign_key: :owner_id
  has_many :bookings, dependent: :destroy, foreign_key: :renter_id
  validates :role, presence: true, inclusion: { in: %w[owner renter]}

  def owner?
    spaces.exists?
  end

  def renter?
    bookings.exists?
  end

  def set_default_role
    self.role ||= "renter"
  end
end
