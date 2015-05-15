require 'rails_helper'

describe Post do
	it 'has a valid factory' do
		expect(build(:post)).to be_valid
	end

	it 'is invalid without title' do
		expect(build(:post, title: nil)).to_not be_valid
	end

	it { should belong_to(:user) }
end
