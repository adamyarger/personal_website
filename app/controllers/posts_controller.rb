class PostsController < ApplicationController
	before_action :authenticate_user!, only: [:create, :update, :destroy]

	def create
		@post = current_user.posts.build(post_params)
		if @post.save
			flash[:success] = "Hizzah! Post Created!"   					
			redirect_to @post
		else
			flash[:alert] = "Great Scott!"
			render :new   
		end
	end

	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	private

		def post_params
			params.require(:post).permit(:title, :content, :user_id)
		end
end
