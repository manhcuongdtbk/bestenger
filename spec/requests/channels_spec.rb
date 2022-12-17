require 'rails_helper'

RSpec.describe 'Channels' do
  describe 'GET /index' do
    let(:user) { create(:user) }
    let(:public_channel) { create(:channel, channel_type: Channel.channel_types[:public]) }
    let(:valid_private_channel) { create(:channel, channel_type: Channel.channel_types[:private]) }
    let(:invalid_private_channel) { create(:channel, channel_type: Channel.channel_types[:private]) }

    before do
      message_within_1_hour = create(:message, created_at: 30.minutes.ago)
      message_since_beginning_of_day = create(:message, created_at: Time.current.beginning_of_day)

      user.channels << valid_private_channel
      public_channel.messages << message_within_1_hour
      valid_private_channel.messages << message_since_beginning_of_day

      sign_in(user)
    end

    it 'returns public and valid private channels' do
      get '/channels'

      expect(response.body).to include(public_channel.name, valid_private_channel.name)
    end
  end

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
