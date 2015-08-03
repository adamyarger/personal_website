class ProjectsController < ApplicationController
	before_action :authenticate_user!, only: [:create, :update, :delete, :new, :edit]

	def create
		@project = Project.new(project_params)
		if @project.save
			flash[:success] = "Hizzah! project Created!"   					
			redirect_to @project
		else
			flash.now[:alert] = "Great Scott!"
			render :new   
		end
	end

	def destroy
		@project = Project.find(params[:id])
		@project.destroy
		flash[:success] = "project deleted"
		redirect_to root_url
	end

	def index
	  @projects = Project.all
	end

	def show
		@project = Project.find(params[:id])
	end

	def new
		@project = Project.new
	end

	def edit
		@project = Project.find(params[:id])
	end

	def update
		@project = Project.find(params[:id])

		if @project.update(project_params)
			flash[:success] = "You did it!"
			redirect_to @project
		else
			flash[:alert] = "Messed somthing up"
			render :edit
		end
	end

	private

		def project_params
			params.require(:project).permit(:title, :content, :description)
		end
end
