class UserCreateForm < Reform::Form
  model :user

  property :username
  property :password

  validates :username, :password, presence: true, accept_blank: false
  validates :username, :password, length: (5..10)
end
