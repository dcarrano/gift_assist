class RecipientSerializer < ActiveModel::Serializer
  attributes :id, :name, :relationship
  has_many :gifts
  has_many :events 
  belongs_to :user
end
