class EventSerializer < ActiveModel::Serializer
  attributes :title, :date, :description
  belongs_to :user
  has_many :gifts
  has_many :recipients
end
