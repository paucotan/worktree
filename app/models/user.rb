class User < ApplicationRecord
  # has_many: bookings
  # has_many
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :spaces, dependent: :destroy, foreign_key: :owner_id
  has_many :bookings, dependent: :destroy, foreign_key: :renter_id
  has_one_attached :photo

  def owner?
    spaces.exists?
  end

  def renter?
    bookings.exists?
  end
end
