require 'rails_helper'

RSpec.describe FizzBuzz, type: :model do
  describe 'select_or_create' do
    context 'find only existing records' do
      let(:fizzbuzz_exists) { FizzBuzz.create(number: 1, value: 1) }

      it 'returns the Fizzbuzz' do
        expect(FizzBuzz.select_or_create_by_numbers([fizzbuzz_exists.number]))
          .to match_array([fizzbuzz_exists])
      end
    end

    context 'find non existing record' do
      it 'creates a new Fizzbuzz if it can\'t find it' do
        expect do
          FizzBuzz.select_or_create_by_numbers([2])
        end.to change { FizzBuzz.count }.by(1)
      end
    end

    context 'find existing and non existing record' do
      let!(:fizzbuzz_exists) { FizzBuzz.create(number: 1, value: 1) }

      it 'creates a new Fizzbuzz if it can\'t find it' do
        expect do
          FizzBuzz.select_or_create_by_numbers([1, 2])
        end.to change { FizzBuzz.count }.by(1)
      end

      it 'returns the correct records' do
        expect(FizzBuzz.select_or_create_by_numbers([1, 2]).map(&:number))
          .to match_array([1, 2])
      end

      it 'returns a Relation' do
        expect(FizzBuzz.select_or_create_by_numbers([1, 2]))
          .to be_an(ActiveRecord::Relation)
      end
    end
  end
end
