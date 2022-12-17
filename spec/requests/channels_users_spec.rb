require 'rails_helper'

RSpec.describe 'ChannelsUsers' do
  describe 'POST /create' do
    it 'returns http created' do
      post '/channels_users'
      expect(response).to have_http_status(:created)
    end
  end
end
