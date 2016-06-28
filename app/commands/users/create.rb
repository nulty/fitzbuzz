module Users
  require 'active_model/validations'
  class Create
    include ActiveModel::Validations

    attr_reader :username, :password

    def initialize(username:, password:)
      @username = username
      @password = password
    end

    def call
      User.create(username: username, password: password) if valid?
    end

    validates :username, :password, presence: true, accept_blank: false
    validates :username, :password, length: (5..10)
  end
end
