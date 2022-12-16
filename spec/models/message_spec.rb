require 'rails_helper'

RSpec.describe Message do
  it { is_expected.to validate_presence_of(:content) }
end
