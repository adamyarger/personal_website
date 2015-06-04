class VideosController < ApplicationController
	before_action :authenticate_user!, only: :create

	def index
		@videos = Video.all
	end

	def show
		@video = Video.find(params[:id])
	end

	def create
		@video = current_user.videos.create(video_params)

		if @video.save
			flash[:success] = 'video posted'
			redirect_to @video
		else
			flash[:error] = 'Somthing went wrong'
			render :new
		end
	end

	def new
		@video = Video.new
	end

	private

		def video_params
			params.require(:video).permit(:title, :content, :description)
		end
end
