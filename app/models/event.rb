class Event < ApplicationRecord
  belongs_to :user
  has_many :event_recipients
  has_many :recipients, through: :event_recipients
  has_many :gifts
end
