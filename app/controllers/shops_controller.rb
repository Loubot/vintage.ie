class ShopsController < ApplicationController
	before_action :authenticate_merchant!, only: [:update, :create, :new, :edit, :destroy]
	before_action :get_shop, only: [:show, :update, :destroy, :edit]

	def get_shop
		@shop = Shop.find(params[:id])
	end

	def index
		@shops = Shop.all
	end

	def show

	end

	def edit

	end

	def new
		@shop = Shop.new
		@shop.merchant_id = params[:merchant_id]
		flash[:notice] = params
	end

	def create
		@shop = Shop.new(shop_params)
		if @shop.save
			flash[:success] = "Shop created succesfully"
			redirect_to new_shop_item_path(@shop)
		else
			flash[:danger] = "Couldn't create shop #{@shop.errors.full_messages}"
			redirect_to new_shop_item_path(@shop)
		end
	end

	def update
		if @shop.update_attributes(shop_params)
			flash[:success] = "Shop updated succesfully"
			redirect_to new_shop_item_path(@shop)
		else
			flash[:danger] = "Couldn't update shop #{@shop.errors.full_messages}"
			render 'edit'
		end
	end

	def destroy
		@shop.destroy
		redirect_to shops_path
	end

	private

	def shop_params
		params.require(:shop).permit!
	end
end
