require 'rails_helper'

RSpec.describe 'Messages' do
  describe 'POST /create' do
    it 'returns http created' do
      post '/messages'
      expect(response).to have_http_status(:created)
    end
  end
end
