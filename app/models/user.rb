class User < ApplicationRecord
  has_many :events
  has_many :recipients

  has_secure_password

  validates_presence_of :username, :email
  validates_uniqueness_of :username
end
