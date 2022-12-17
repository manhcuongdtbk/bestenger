require 'rails_helper'

RSpec.describe User do
  let(:user) { create(:user) }

  it { is_expected.to have_many(:channels_users).dependent(:destroy) }
  it { is_expected.to have_many(:channels).through(:channels_users) }

  describe '#private_channel_id_with' do
    let(:another_user) { create(:user) }

    context 'when user has a private channel with another user' do
      let(:channel) { create(:channel, channel_type: Channel.channel_types[:private]) }

      before do
        channel.users << [user, another_user]
      end

      it 'returns private channel id' do
        expect(user.private_channel_id_with(another_user)).to eq(channel.id)
      end
    end

    context 'when user does not have any private channel with another user' do
      it 'returns nil' do
        expect(user.private_channel_id_with(another_user)).to be_nil
      end
    end
  end
end
