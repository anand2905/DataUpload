class PicturesController < ApplicationController
	before_action :find_picture, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, only: [:index, :new, :edit, :show]
	def index
		@pictures = current_user.pictures.all.order("created_at DESC"
			)
	end

	def new
		@picture = current_user.pictures.build
	end

	def show
	end

	def create
		@picture = current_user.pictures.build(picture_params)
		if @picture.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @picture.update(picture_params)
			redirect_to picture_path(@picture)
		else
			render 'edit'
		end
	end

	def destroy
		@picture.destroy
		redirect_to root_path
	end
	
	private

		def picture_params
			params.require(:picture).permit(:title, :description, :file_image)
		end

		def find_picture
			@picture = Picture.find(params[:id])
		end
end
