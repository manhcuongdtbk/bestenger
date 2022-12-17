require 'rails_helper'

RSpec.describe 'Channels' do
  describe 'GET /show' do
    let(:channel) { create(:channel) }

    before do
      sign_in(create(:user))
    end

    it 'returns http success' do
      get "/channels/#{channel.id}"

      expect(response).to have_http_status(:success)
    end
  end
end
