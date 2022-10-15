class Reservation < ApplicationRecord
  belongs_to :room
  belongs_to :user

  validates :check_in_date, presence: true
  validates :check_out_date, presence: true
end
