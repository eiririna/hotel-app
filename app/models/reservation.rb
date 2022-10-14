class Reservation < ApplicationRecord
  belongs_to :room
  belongs_to :user

  validates :reservation_date, presence: true
end
