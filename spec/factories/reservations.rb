FactoryBot.define do
  factory :reservation do
    room { nil }
    user { nil }
    reservation_date { "2022-10-11" }
  end
end
