class User < ApplicationRecord
  has_many :events
  has_many :recipients

  has_secure_password

  validates_presence_of :email
  validates_uniqueness_of :email, :username
end
