require 'rails_helper'

RSpec.describe 'ChannelsUsers' do
  describe 'POST /create' do
    let(:channel) { create(:channel) }

    before do
      sign_in(create(:user))
    end

    it 'redirects to channel show page' do
      post "/channels/#{channel.id}/channels_users"

      expect(response).to redirect_to(channel_path(channel))
    end
  end
end
