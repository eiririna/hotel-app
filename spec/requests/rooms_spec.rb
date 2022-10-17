require 'rails_helper'

RSpec.describe 'Rooms', type: :request do
  let(:valid_attributes) do
    {
      name: 'president',
      description: 'simple room',
      price: 777
    }
  end
  describe 'GET show' do
    let(:room) { create(:room) }

    it 'succeeds' do
      get room_path(room)
      expect(response).to be_successful
    end
  end
  describe 'GET /index' do
    it 'succeeds' do
      Room.create! valid_attributes
      get rooms_path
      expect(response).to be_successful
    end
  end
end
