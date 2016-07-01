require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the UsersFizzbuzzsHelper. For example:
#
# describe UsersFizzbuzzsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe HomepageHelper, type: :helper do
  describe 'page_options' do
    let(:array) { [[25, 25], [50, 50], [75, 75], [100, 100]] }

    it 'returns multiples of 25 upto 100' do
      expect(page_options).to eq(array)
    end
  end

  describe 'per_page_pref' do
    let(:per_page) { { per_page: 75 } }

    context 'per_page session unset' do
      it 'returns 100 by default' do
        expect(per_page_pref).to eq(100)
      end
    end

    context 'per_page session set to 25' do
      before do
        session[:per_page] = 25
      end

      it 'returns 25' do
        expect(per_page_pref).to eq(25)
      end
    end
  end
end
