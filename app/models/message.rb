class Message < ApplicationRecord
  belongs_to :channel
  belongs_to :user

  scope :active_messages, lambda {
    where('created_at >= ?', 1.hour.ago).or(Message.where('created_at >= ?', Time.current.beginning_of_day))
  }

  validates :content, presence: true
end
