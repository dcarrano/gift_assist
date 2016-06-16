class GiftSerializer < ActiveModel::Serializer
  attributes :id, :name, :url, :price, :priority
  belongs_to :event
  belongs_to :recipient
end
