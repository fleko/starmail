class Message < ApplicationRecord
  validates :originator, presence: true
  validates :recipient, presence: true
  validates :content, length: { maximum: 256 }
end
