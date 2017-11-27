class ItemsController < ApplicationController
    
    def new
        @item = Item.new
    end
    
    def create 
        @item = Item.new(item_params)
        @item.user = current_user

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
end
