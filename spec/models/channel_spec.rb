require 'rails_helper'

RSpec.describe Channel do
  let(:channel) { build(:channel) }

  it { is_expected.to have_many(:channels_users).dependent(:destroy) }
  it { is_expected.to have_many(:users).through(:channels_users) }
  it { is_expected.to have_many(:messages).dependent(:destroy) }

  it do
    expect(channel).to(
      define_enum_for(:channel_type).with_values(public: 'public', group: 'group', private: 'private')
                                    .backed_by_column_of_type(:string)
                                    .with_suffix
    )
  end

  it { is_expected.to validate_presence_of(:name) }

  describe 'validates uniqueness of name' do
    it { expect(channel).to validate_uniqueness_of(:name) }
  end
end
