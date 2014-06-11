class PhotosController < ApplicationController
	def index
		flash[:notice] = params
		@context = context
		@photos = @context.photos.all
	end

	def show
		flash[:notice] = params
		@context = context

		@photo = @context.photos.find(params[:id])
	end

	def new
		flash[:notice] = params
		@context = context
		@photo = @context.photos.new
	end

	def create
		@context = context
		@photo = @context.photos.new(photo_params)
		if @photo.save
			flash[:success] = 'Hooray'
			redirect_to edit_item_photo_path(@context.id, @photo.id)
		else
			flash[:danger] = "Nope #{@photo.errors.full_messages}"
			render 'new'
		end
	end

	def edit
		@context = context
		@photo = @context.photos.find(params[:id])
	end

	private

	def photo_params
		params.require(:photo).permit!
	end
	def context
    if params[:shop_id]
      id = params[:shop_id]
      Shop.find(params[:person_id])
    else
      id = params[:item_id]
      Item.find(params[:item_id])
    end
  end 
end
