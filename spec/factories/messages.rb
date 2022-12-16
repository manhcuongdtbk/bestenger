FactoryBot.define do
  factory :message do
    channel
    user
    content { Faker::Lorem.sentence }
  end
end
