require 'rails_helper'

RSpec.describe Message do
  it { is_expected.to belong_to(:channel) }
  it { is_expected.to belong_to(:user) }

  describe '.active_messages' do
    let(:message_within_1_hour) { create(:message, created_at: 30.minutes.ago) }
    let(:message_since_beginning_of_day) { create(:message, created_at: Time.current.beginning_of_day) }

    it 'returns active messages' do
      expect(described_class.active_messages).to include(message_within_1_hour, message_since_beginning_of_day)
    end
  end

  it { is_expected.to validate_presence_of(:content) }
end
