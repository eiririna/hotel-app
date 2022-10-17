require 'rails_helper'

RSpec.describe 'Rooms', type: :request do
  describe 'GET show' do
    let(:room) { create(:room) }

    it 'succeeds' do
      get room_path(room)
      expect(response).to be_successful
    end
  end
end
