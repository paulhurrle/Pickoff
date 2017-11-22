class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
#        if current_user
#            @user = current_user
#            render :show
#        else 
#            redirect_to home_index_path
#        end
    end
end
