# require 'rails_helper'

# RSpec.describe Users::Create do
#   describe 'init' do
#     it 'validates presence of username' do
#       expect(described_class.new(password: 'q' * 5, username: ''))
#         .to be_invalid
#     end

#     describe 'username length' do
#       it 'username is too short' do
#         expect(described_class.new(password: 'q' * 5, username: 'r' * 4))
#           .to be_invalid
#       end

#       it 'username is too long' do
#         expect(described_class.new(password: 'q' * 5, username: 'r' * 11))
#           .to be_invalid
#       end
#     end

#     describe 'password length' do
#       it 'password is too short' do
#         expect(described_class.new(password: 'r' * 4, username: 'q' * 5))
#           .to be_invalid
#       end

#       it 'password is too long' do
#         expect(described_class.new(password: 'r' * 11, username: 'q' * 5))
#           .to be_invalid
#       end
#     end
#   end

#   describe 'call' do
#     describe 'valid user' do
#       let(:user) { described_class.new(password: 'password', username: 'username') }

#       it 'saves the user' do
#         expect { user.call }.to change { User.count }.by(1)
#       end
#     end

#     describe 'invalid user' do
#       let(:user) { described_class.new(password: 'd', username: 'e') }
#       it 'fails to save' do
#         expect { user.call }.not_to change { User.count }
#       end
#     end
#   end
# end
