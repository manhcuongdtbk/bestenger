FactoryBot.define do
  factory :channel do
    name { Faker::Company.name }
    channel_type { Channel.channel_types.values.sample }
  end
end
