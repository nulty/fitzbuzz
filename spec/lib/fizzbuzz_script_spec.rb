require 'spec_helper'
require 'fizzbuzz_script'

RSpec.describe FizzbuzzScript do
  describe '.call' do
    context 'number modulo 15 is 0' do
      it 'returns \'fizzbuzz\'' do
        expect(described_class.call(15)).to eq(FizzbuzzScript::FIZZBUZZ)
      end
    end

    context 'number modulo 5 is 0' do
      it 'returns \'buzz\'' do
        expect(described_class.call(10)).to eq(FizzbuzzScript::BUZZ)
      end
    end

    context 'number modulo 3 is 0' do
      it 'returns \'buzz\'' do
        expect(described_class.call(9)).to eq(FizzbuzzScript::FIZZ)
      end
    end
  end
end
