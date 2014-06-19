class MerchantsController < ApplicationController
	before_action :authenticate_merchant!, only: [:update, :create, :new, :edit, :destroy]
	before_action :correct_merchant?, only: [:edit, :update, :destroy]

	def correct_merchant?
		if current_merchant != get_merchant
			redirect_to edit_merchant_path(current_merchant)
		end
	end	

	def get_merchant
		@merchant = Merchant.find(params[:id])
	end

	def index
		@merchants = Merchant.all
	end	
	
	def show
		@merhant = current_merchant
	end

	def new
		@merchant = Merchant.new
		flash[:notice]= params
	end

	def edit
		@params = params
		@merchant = Merchant.find(params[:id])
		@photo = @merchant.photos.new
	end

	def create
		@merchant = Merchant.create(merchant_params)
		if @merchant.save
			flash.now[:success] = 'Merchant created successfully'
			redirect_to new_merchant_shop_path(current_merchant.id)
		else
			flash[:danger] = "Failed to create Merchant #{@merchant.errors.full_messages}"
			render 'new'
		end
	end

	def update
		@merchant = Merchant.find(current_merchant.id)
		if @merchant.update_without_password(merchant_params)
			flash.now[:success] = "Merchant successfully updated"
			redirect_to new_merchant_shop_path(current_merchant.id)
		else
			flash[:danger] = "Couldn't update merchant #{@merchant.errors.full_messages}"
			render 'new'
		end
	end

	def destroy 
		@merchant = current_merchant
		@merchant.destroy
		redirect_to root_path
	end

	private	

		def merchant_params
			params.require(:merchant).permit!
		end

end
