class ShopsController < ApplicationController

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
	end

	def create
		@shop = Shop.new(shop_params)
		if @shop.save
			flash[:success] = "Shop created succesfully"
			redirect_to edit_shop_path(@shop)
		else
			flash[:danger] = "Couldn't create shop #{@shop.errors.full_messages}"
			render 'new'
		end
	end

	def update
		if @shop.update_attributes
			flash[:success] = "Shop updated succesfully"
			render 'edit'
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
