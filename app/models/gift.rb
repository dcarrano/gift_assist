class Gift < ApplicationRecord
  belongs_to :event, optional: true
  belongs_to :recipient, optional: true

  validates_presence_of :name
end
