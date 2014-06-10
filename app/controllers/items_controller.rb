class ItemsController < ApplicationController
	

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
			flash[:success] = 'Item created succesfully'
			redirect_to edit_shop_item_path(@shop, @item)
		else
			flash[:danger] = "Couldn't create item #{@item.errors.full_messages}"
			render 'new'
		end
	end

	def update
		@item = Item.find(params[:id])
		@shop = Shop.find(item_params[:shop_id])
		if @item.update_attributes(item_params)
			flash[:success] = "Item updated succesfully"
			redirect_to edit_shop_item_path(@shop, @item)
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
