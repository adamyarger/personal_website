class PostsController < ApplicationController
	before_action :authenticate_user!, only: [:create, :update, :destroy]

	def create
		@post = current_user.posts.build(post_params)
		if @post.save
			flash[:success] = "Hizzah! Post Created!"   					
			redirect_to @post
		else
			flash.now[:alert] = "Great Scott!"
			render :new   
		end
	end

	def destroy
		@post.destroy
		flash[:success] = "Post deleted"
		redirect_to request.refferrer || root_url
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

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = current_user.posts.find(params[:id])

		if post.update(post_params)
			flash[:success] = "You did it!"
			redirect_to @post
		else
			flash[:alert] = "Messed somthing up"
			render :edit
		end
	end

	private

		def post_params
			params.require(:post).permit(:title, :content, :user_id, :description)
		end
end
