class ItemsController < ApplicationController
    def create 
        @item = Item.new(item_params)
        @item.user = current_user

        if @item.save
          flash[:notice] = "Item was saved."
        else
          flash.now[:alert] = "There was an error saving the item. Please try again."
        end
        
        render [@user]
        
        private

        def item_params
            params.require(:item).permit(:name)
        end
    end
end
