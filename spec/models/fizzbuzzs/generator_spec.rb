require 'rails_helper'

RSpec.describe Fizzbuzzs::Generator do
  describe '.generate' do
    it 'generates the correct fizzbuzz' do
      expect { described_class.generate(15) }.to change { FizzBuzz.count }.by(15)
    end
  end

  describe 'generate_params' do
    let(:batch) { (1..15) }
    let(:first_15_fizzbuzz) do
      [
        { value: 1,          number: 1 },
        { value: 2,          number: 2 },
        { value: 'fizz',     number: 3 },
        { value: 4,          number: 4 },
        { value: 'buzz',     number: 5 },
        { value: 'fizz',     number: 6 },
        { value: 7,          number: 7 },
        { value: 8,          number: 8 },
        { value: 'fizz',     number: 9 },
        { value: 'buzz',     number: 10 },
        { value: 11,         number: 11 },
        { value: 'fizz',     number: 12 },
        { value: 13,         number: 13 },
        { value: 14,         number: 14 },
        { value: 'fizzbuzz', number: 15 }
      ]
    end
    it 'returns an array of hash params' do
      expect(described_class.generate_params(batch)).to eq(first_15_fizzbuzz)
    end
  end
end
