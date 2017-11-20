class UsersController < ApplicationController
    def show
        if current_user
            @user = current_user
            render :show
        else 
            redirect_to home_index_path
        end
    end
end
