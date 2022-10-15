require 'rails_helper'

RSpec.describe Room, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
  it { is_expected.to monetize(:price).allow_nil }

  it { should have_many(:reservations).dependent(:destroy) }
  it { should have_many(:reserved_users).through(:reservations).source(:user) }
end
