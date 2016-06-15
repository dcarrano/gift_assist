class Recipient < ApplicationRecord
  belongs_to :user
  has_many :event_recipients
  has_many :events, through: :event_recipients
  has_many :gifts

  validates_presence_of :name
end
