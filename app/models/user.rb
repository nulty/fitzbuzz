class User < ActiveRecord::Base
  has_secure_password

  has_many :favourite_fizz_buzzs, class_name: 'UsersFizzBuzz'
  has_many :fizz_buzzs, through: :favourite_fizz_buzzs
end
