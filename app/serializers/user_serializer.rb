class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :password, :password_confirmation, :email
  has_many :events
  has_many :recipients 
end
