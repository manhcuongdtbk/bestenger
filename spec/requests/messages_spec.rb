require 'rails_helper'

RSpec.describe 'Messages' do
  describe 'POST /create' do
    let(:channel) { create(:channel) }
    let(:user) { create(:user) }

    before do
      sign_in(user)
      user.channels << channel
    end

    it 'returns http no_content', :aggregate_failures do
      expect do
        post "/channels/#{channel.id}/messages", params: { message: { content: Faker::Lorem.sentence } }
      end.to have_broadcasted_to(channel).from_channel(MessageChannel)
      expect(response).to have_http_status(:no_content)
    end
  end
end
