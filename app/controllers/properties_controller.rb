class PropertiesController < ApplicationController

  before_action :set_property, only: [:show, :edit, :update, :destroy]
  before_filter :redirect_unless_signed_in, only: [:index, :edit_architecture, :edit_interior_design, 
                                                   :edit_additions, :edit_renovations, :edit_works_in_progress]

	def index
		@photo = Photo.new
		@home_bgs = Photo.where(page_id: 0)
		@about_bg = Photo.where(page_id: 1).first
		@recognition_bg = Photo.where(page_id: 2).first
		@affiliates_bg = Photo.where(page_id: 3).first
		@contact_bg = Photo.where(page_id: 4).first
	end

	def show
	end

	def new
    @property = Property.new
	end

	def edit
	end

	def create
		@property = Property.new(property_params)

		respond_to do |format|
			if @property.save
				format.html { redirect_to edit_property_path(@property), notice: 'Property was successfully created.' }
			else
				format.html { render action: 'new' }
			end
		end
	end

	def update
		respond_to do |format|
			if @property.update(property_params)
				format.html { redirect_to edit_property_path(@property), notice: 'Property was successfully updated.' }
			else
				format.html { render action: 'edit' }
			end
		end
	end

	def destroy
		@property.destroy
		
		respond_to do |format|
			format.html { redirect_to properties_url }
		end
	end

	#####################

	def architecture
		@properties = Property.where(category_id: 0)
	end

	def interior_design
		@properties = Property.where(category_id: 0)
	end

	def renovations
		@properties = Property.where(category_id: 0)
	end

	def additions
		@properties = Property.where(category_id: 0)
	end

	def works_in_progress
		@properties = Property.where(category_id: 0)
	end

	def edit_architecture
		@properties = Property.where(category_id: 0)
	end

  def edit_architecture
    @category_id = 0
    @new_property = Property.new
    @properties = Property.where(category_id: 0)
  end

  def edit_interior_design
    @category_id = 1
    @new_property = Property.new
    @properties = Property.where(category_id: 1)
  end

  def edit_renovations
    @category_id = 2
    @new_property = Property.new
    @properties = Property.where(category_id: 2)
  end

  def edit_additions
    @category_id = 3
    @new_property = Property.new
    @properties = Property.where(category_id: 3)
  end

  def edit_works_in_progress
    @category_id = 4
    @new_property = Property.new
    @properties = Property.where(category_id: 4)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def property_params
      params[:property].permit(:name, :description, :category_id)
    end

    def redirect_unless_signed_in
      if !signed_in?
        redirect_to signin_path
        return
      end
    end

end
