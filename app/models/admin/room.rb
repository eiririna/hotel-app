module Admin
  class Room < ApplicationRecord
    validates :name, presence: true
    validates :description, presence: true

    monetize :price_cents, allow_nil: true

    has_many_attached :images, dependent: :destroy

    has_many :reservations, dependent: :destroy
    has_many :reserved_users, through: :reservations, source: :user
    def default_image
      images.first
    end
  end
end
