class PostsController < ApplicationController
	before_action :authenticate_user!, only: [:create, :update, :delete, :new, :edit]

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
		@post = Post.find(params[:id])
		@post.destroy
		flash[:success] = "Post deleted"
		redirect_to root_url
	end

	def index
	  if params[:tag]
	    @posts = Post.tagged_with(params[:tag])
	  else
	    @posts = Post.all
	  end
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

		if @post.update(post_params)
			flash[:success] = "You did it!"
			redirect_to @post
		else
			flash[:alert] = "Messed somthing up"
			render :edit
		end
	end

	private

		def post_params
			params.require(:post).permit(:title, :content, :user_id, :description, :tag_list, :name)
		end
end
