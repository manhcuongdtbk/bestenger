class Channel < ApplicationRecord
  has_many :channels_users, dependent: :destroy
  has_many :users, through: :channels_users

  enum :channel_type, { public: 'public', group: 'group', private: 'private' }, suffix: true

  validates :name, presence: true, uniqueness: true
end
