class MerchantsController < ApplicationController
	before_action :authenticate_merchant!, only: [:update, :create, :new, :edit, :destroy]
	before_action :get_merchant, only: [:show, :destroy]

	def get_merchant
		@merchant = Merchant.find(params[:id])
	end

	def index
		@merchants = Merchant.all
	end	
	
	def show
		
	end

	def new
		@merchant = Merchant.new
		flash[:notice]= params
	end

	def edit
		@merchant = Merchant.find(current_merchant.id)
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
		@merchant.destroy
		redirect_to root_path
	end

	private	

		def merchant_params
			params.require(:merchant).permit!
		end

end
