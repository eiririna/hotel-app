class Room < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true

  monetize :price_cents, allow_nil: true

  has_many_attached :images, dependent: :destroy

  has_many :reviews, as: :reviewable
  has_many :reservations, dependent: :destroy
  has_many :reserved_users, through: :reservations, source: :user
  def default_image
    images.first
  end

  def average_rating
    reviews.average(:rating).round(1)
  end

  def available_dates
    next_reservation = reservations.where("reservation_date >  ?", Date.today).order(:reservation_date).first
    Date.tomorrow..next_reservation.reservation_date
  end
end

