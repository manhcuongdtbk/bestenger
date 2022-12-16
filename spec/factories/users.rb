FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Number.number(digits: Devise.password_length.min) }
  end
end
