class PhotosController < ApplicationController
	before_action :authenticate_merchant!, only: [:update, :create, :new, :edit, :destroy]
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
		@photo = @context.photos.build(photo_params)

		respond_to do |format|
			if @photo.save
				flash[:success] = "cool"
				format.html { redirect_to edit_item_photo_path(@context, @photo) }
				format.json { render json: @photo }
			else
				flash[:danger] = "Nope @photos.errors.full_messages"
				format.html { redirect_to edit_item_photo_path(@context, @photo) }
			end
		end

		
	end

	def update
		@context = context 
		@photo = @context.photos.find(params[:id])
		if @photo.update_attributes(photo_params)
			flash[:success] = "Photo updated"
			redirect_to edit_item_photo_path(@context, @photo)
		else
			flash[:danger] = "Couldn't update #{@photo.errors.full_messages}"
			render 'edit'
		end
	end

	def edit
		@context = context
		@photo = @context.photos.find(params[:id])
	end

	def destroy
		@context = context
		@photo = @context.photos.find(params[:id])
		if @photo.destroy
			flash[:success] = "Photo deleted"
			redirect_to :back
		else
			flash[:danger] = "Could not delete photo #{@photo.errors.full_messages}"
			render 'edit'
		end
	end

	private

	def photo_params
		params.require(:photo).permit!
	end
	def context
    if params[:shop_id]
      id = params[:shop_id]
      Shop.find(params[:shop_id])
    elsif params[:item_id]    	
      id = params[:item_id]
      Item.find(params[:item_id])
    else
    	Merchant.find(params[:merchant_id])
    end
  end 
end
