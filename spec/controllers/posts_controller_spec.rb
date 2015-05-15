require 'rails_helper'
# require 'spec_helper'

describe PostsController, type: :controller do

	# include Devise::TestHelpers
	it { should use_before_action(:authenticate_user!) }
	it { should_not use_before_action(:prevent_ssl) }

	describe 'POST #create' do
	    context 'with valid attributes' do
			before(:each) do
				# @request.env["devise.mapping"] = Devise.mappings[:user]
				user = FactoryGirl.create :user
				sign_in user
			end
	    	
			it 'creates the post' do
				post :create, post: attributes_for(:post)
				expect(Post.count).to eq(1)
			end

			it 'redirects to the "show" action for the new post' do
				post :create, post: attributes_for(:post)
				expect(response).to redirect_to Post.first
			end
	    end

	    context 'with invalid attributes' do
	    	before(:each) do
					# @request.env["devise.mapping"] = Devise.mappings[:user]
					user = FactoryGirl.create :user
					sign_in user
				end

	    	it 'does not create the post' do
	    		post :create, post: attributes_for(:post, title: nil)
	    		expect(Post.count).to eq(0)
	    	end

	    	it 're-renders the new view' do
	    		post :create, post: attributes_for(:post, title: nil)
	    		expect(response).to render_template :new
	    	end
	    end
	end

	describe 'GET #show' do
		it 'assigns the requested post to @post' do
			post = FactoryGirl.create :post
			get :show, id: post
			expect(post).to eq (post)
		end

		it 'renders the #show view' do
			post = FactoryGirl.create :post
			get :show, id: post
			expect(response).to render_template :show
		end
	end

	describe "GET #index" do
		before(:each) do
			4.times { FactoryGirl.create :post }
			get :index
		end

		it { is_expected.to respond_with :ok }

		it "returns 4 records from the database" do
			expect(response).to render_template :index
		end
	end

	# describe "PUT/PATCH #update" do
	# 	before(:each) do
	# 		user = FactoryGirl.create :user
	# 		sign_in user
	# 	end

	# 	it 'updates the post' do
	# 		post :update, post: attributes_for(:post)
	# 		expect(Post.count).to eq(1)
	# 	end

	# 	it 'redirects to the "show" post' do
	# 		post :update, post: attributes_for(:post)
	# 		expect(response).to redirect_to Post.first
	# 	end

	# end
	
end







