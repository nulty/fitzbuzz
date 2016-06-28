require 'rails_helper'

RSpec.describe UserCreateForm do
  let(:form) { described_class.new(User.new) }

  describe 'init' do
    describe 'username length' do
      it 'username is too short' do
        expect(form.validate(password: 'q' * 5, username: 'r' * 4))
          .to be_falsey
      end

      it 'username is too long' do
        expect(form.validate(password: 'q' * 5, username: 'r' * 11))
          .to be_falsey
      end
    end

    describe 'password length' do
      it 'password is too short' do
        expect(form.validate(password: 'r' * 4, username: 'q' * 5))
          .to be_falsey
      end

      it 'password is too long' do
        expect(form.validate(password: 'r' * 11, username: 'q' * 5))
          .to be_falsey
      end
    end
  end

  describe 'call' do
    describe 'valid user' do
      before do
        form.validate(password: 'password', username: 'username')
      end

      it 'saves the user' do
        expect { form.save }.to change { User.count }.by(1)
      end
    end

    describe 'invalid user' do
      let(:user) { form.validate(password: 'd', username: 'e') }
      it 'fails to save' do
        expect { form.save }.not_to change { User.count }
      end
    end
  end
end
