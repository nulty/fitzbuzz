class User < ActiveRecord::Base
  has_secure_password

  has_many :users_fizz_buzzs
  has_many :fizz_buzzs, through: :users_fizz_buzzs
end
