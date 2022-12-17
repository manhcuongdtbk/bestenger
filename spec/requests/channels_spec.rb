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

  describe 'POST /create' do
    let(:user) { create(:user) }
    let(:channel) { create(:channel, channel_type: Channel.channel_types[:private]) }

    before do
      sign_in(user)
    end

    context 'when user already has a private channel with to_user' do
      let(:to_user) { create(:user) }

      before do
        channel.users << [user, to_user]
      end

      it 'redirects to channel show page' do
        post '/channels', params: { to_user_id: to_user.id }

        expect(response).to redirect_to(channel_path(channel))
      end
    end

    context 'when user does not have any private channel with to_user' do
      let(:to_user) { create(:user) }

      it 'creates and redirect to channel show page' do
        post '/channels', params: { to_user_id: to_user.id }

        expect(response).to redirect_to(channel_path(user.private_channel_id_with(to_user)))
      end
    end
  end
end
