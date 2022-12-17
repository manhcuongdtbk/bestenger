require 'rails_helper'

RSpec.describe 'Channels' do
  describe 'GET /show' do
    it 'returns http success' do
      get '/channels/show'
      expect(response).to have_http_status(:success)
    end
  end
end
