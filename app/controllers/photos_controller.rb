class PhotosController < ApplicationController
	before_action :set_photo, only: [:show, :edit, :update, :destroy]
	skip_before_filter :verify_authenticity_token, :only => :create

	def index
	end

	def show
	end

	def new
		@photo = Photo.new
	end

	def edit
	end

	def create
		if photo_params[:page_id] && photo_params[:page_id] != "0"
			Photo.where(page_id: photo_params[:page_id]).destroy_all
		end
		image_url = photo_params[:filename]
		@photo = Photo.new(photo_params.except(:filename))

		respond_to do |format|
			if @photo.save
				@photo.store_image(image_url)
				format.html { redirect_to properties_url, notice: 'Photo successfully added!' }
			else
				format.html { render action: 'new' }
			end
		end
	end

	def update
		respond_to do |format|
			if @photo.update(photo_params)
				format.html { redirect_to @photo, notice: 'Success!'}
			else
				format.html { render action: 'edit' }
			end
		end
	end

	def destroy
		@photo.destroy

		respond_to do |format|
			format.html { redirect_to properties_url }
		end
	end

	private
		def set_photo
			@photo = Photo.find(params[:id])
		end

		def photo_params
			params.require(:photo).permit(:name, :description, :filename, :page_id, :property_id)
		end
end
