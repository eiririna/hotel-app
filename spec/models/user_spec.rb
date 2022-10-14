require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:reservations).dependent(:destroy) }
  it { should have_many(:reserved_rooms).through(:reservations).source(:room)}
  it { should have_many(:reviews).dependent(:destroy )}
end
