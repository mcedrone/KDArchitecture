class Photo < ActiveRecord::Base
	belongs_to :property

	PAGE_IDS = ["Home", "About", "Recognition", "Affiliates", "Contact"]

	def store_image(pic)
		require 'fileutils'
		tmp = pic.tempfile # create source url of picture
		file = File.join("public/photo_files/#{id}") # create destination url for file
		FileUtils.cp tmp.path, file # copy from source(tmp) to destination(file)
		update_attributes(filename: "/photo_files/#{id}")
	end
end
