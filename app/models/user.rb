class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reservations, dependent: :destroy
  has_many :reserved_rooms, through: :reservations, source: :room
  has_many :reviews, dependent: :destroy

  def full_name
    "#{first_name} #{last_name}".squish
  end
end
