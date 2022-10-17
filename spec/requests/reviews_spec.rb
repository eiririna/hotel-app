# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Reviews', type: :request do
  let(:valid_attributes) do
    {
      rating: '4',
      title: 'title',
      body: 'body'
    }
  end

  describe 'GET /index' do
    it 'succeeds' do
      Review.create! valid_attributes
      get reviews_path
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    it 'succeeds' do
      expect do
        post reviews_path, params: { review: valid_attributes }
      end
    end
  end
end
