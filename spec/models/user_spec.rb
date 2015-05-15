require 'rails_helper'

describe User do
	before {@user = FactoryGirl.build(:user)}

	subject {@user}

	it { should validate_presence_of(:email) }
	it { should validate_uniqueness_of(:email) }
	it { should validate_confirmation_of(:password) }
	it { should allow_value('example@domain.com').for(:email) }

	it { should have_many(:posts) }

	# it { should have_attached_file(:avatar) }
	# it { should validate_attachment_content_type(:avatar).allowing('image/png', 'image/gif').rejecting('text/plain', 'text/xml') }
	# it { should validate_attachment_size(:avatar).less_than(2.megabytes) }
	
end
