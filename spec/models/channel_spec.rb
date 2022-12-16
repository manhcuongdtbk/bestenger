require 'rails_helper'

RSpec.describe Channel do
  it { is_expected.to have_many(:channels_users).dependent(:destroy) }
  it { is_expected.to have_many(:users).through(:channels_users) }

  it { is_expected.to validate_presence_of(:name) }

  describe 'validates uniqueness of name' do
    let(:channel) { build(:channel) }

    it { expect(channel).to validate_uniqueness_of(:name) }
  end
end
