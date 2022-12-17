class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :channels_users, dependent: :destroy
  has_many :channels, through: :channels_users

  def private_channel_id_with(to_user)
    private_channel_id = channels.private_channel_type.ids.intersection(to_user.channels.private_channel_type.ids)
    private_channel_id.length == 1 ? private_channel_id.first : nil
  end
end
