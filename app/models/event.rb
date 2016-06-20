class Event < ApplicationRecord
  belongs_to :user, optional: true
  has_many :event_recipients, dependent: :destroy
  has_many :recipients, through: :event_recipients
  has_many :gifts, dependent: :destroy

  validates_presence_of :title, :date
end
