class VideosController < ApplicationController
	before_action :authenticate_user!, only: [:create, :update, :delete, :new, :edit]

	def index
		@videos = Video.all
	end

	def show
		@video = Video.find(params[:id])
	end

	def create
		@video = current_user.videos.create(video_params)

		if @video.save
			flash[:success] = 'Video Posted'
			redirect_to @video
		else
			flash[:error] = 'Somthing went wrong'
			render :new
		end
	end

	def new
		@video = Video.new
	end

	def edit
		@video = Video.find(params[:id])
	end

	def update
		@video = current_user.videos.find(params[:id])

		if @video.update(video_params)
			flash[:success] = "You did it!"
			redirect_to @video
		else
			flash[:alert] = "Messed somthing up"
			render :edit
		end
	end

	def destroy
		@video = Video.find(params[:id])
		@video.destroy
		flash[:success] = "Video deleted"
		redirect_to root_url
	end

	private

		def video_params
			params.require(:video).permit(:title, :content, :description)
		end
end
