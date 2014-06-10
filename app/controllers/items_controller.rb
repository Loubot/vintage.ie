class ItemsController < ApplicationController
	before_action :get_item, only: [:show, :update, :destroy, :edit]

	def get_item
		@item = Item.find(params[:id])
	end

	def index
		@items = Item.all
	end

	def show

	end

	def edit
		@shop = Shop.find(params[:shop_id])
		@item = Item.find(params[:id])
	end

	def new
		@shop = Shop.find(params[:shop_id])
		@item = Item.new
		flash[:notice] = params
		
	end

	def create
		@item = Item.new(item_params)
		@shop = Shop.find(item_params[:shop_id])
		if @item.save
			flash[:success] = @shop.id
			redirect_to :back
		else
			flash[:danger] = "Couldn't create item #{@item.errors.full_messages}"
			render 'new'
		end
	end

	def update
		if @item.update_attributes
			flash[:success] = "item updated succesfully"
			render 'edit'
		else
			flash[:danger] = "Couldn't update item #{@item.errors.full_messages}"
			render 'edit'
		end
	end

	def destroy
		@item.destroy
		redirect_to shop_items_path
	end

	private

	def item_params
		params.require(:item).permit!
	end
end
