class ItemsController < ApplicationController
	before_save :expired
	
    def new
        @item = Item.new
    end
    
    def create 
        @item = Item.new(item_params)
        @item.user = current_user
		@item.expires_at = Time.now + 7.days

        if @item.save
          flash[:notice] = "Item was saved."
        else
          flash.now[:alert] = "There was an error saving the item. Please try again."
        end
        redirect_to @item.user
    end
    
    def destroy
        @item = Item.find(params[:id])
        @item.delete
    end
    
    private

    def item_params
        params.require(:item).permit(:name)
    end
	
	def expired
		Item.where("expires_at <= ?", Time.now).destroy_all
	end
end
