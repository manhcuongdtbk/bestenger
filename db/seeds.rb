User.create(email: 'user@example.com', password: '123456')

1.upto(30) do |n|
  User.create(email: "user#{n}@example.com", password: '123456')
end

Channel.channel_types.each_value do |channel_type|
  3.times do
    Channel.create(name: Faker::Lorem.word, channel_type:)
  end
end

Channel.public_channel_type.first.users << User.all
Channel.public_channel_type.second.users << User.first(3)
Channel.public_channel_type.third.users << User.first(2)

Channel.private_channel_type.first.users << User.first(2)
Channel.private_channel_type.second.users << User.offset(1).first(2)
Channel.private_channel_type.third.users << User.offset(2).first(2)

Channel.find_each do |channel|
  users = channel.users

  messages = 1.upto(20).map do
    { content: Faker::Lorem.sentence, channel_id: channel.id, user_id: users.sample.id }
  end

  Message.insert_all(messages) # rubocop:disable Rails/SkipsModelValidations
end
