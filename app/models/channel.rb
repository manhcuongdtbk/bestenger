class Channel < ApplicationRecord
  has_many :channels_users, dependent: :destroy
  has_many :users, through: :channels_users

  validates :name, presence: true, uniqueness: true
end
