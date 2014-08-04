class DashboardController < ApplicationController

	def home
		@bg_images = Photo.where(page_id: 0)
	end

	def about
		@bg_image = Photo.where(page_id: 1).first
	end

	def recognition
		@bg_image = Photo.where(page_id: 2).first
	end

	def affiliates
		@bg_image = Photo.where(page_id: 3).first
	end

	def contact
		@bg_image = Photo.where(page_id: 4).first
	end

end
