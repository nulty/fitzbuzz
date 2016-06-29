class UsersFizzBuzz < ActiveRecord::Base
  belongs_to :user
  belongs_to :fizz_buzz
end
