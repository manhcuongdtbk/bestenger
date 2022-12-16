require 'rails_helper'

RSpec.describe User do
  it { is_expected.to have_many(:channels_users).dependent(:destroy) }
  it { is_expected.to have_many(:channels).through(:channels_users) }
end
