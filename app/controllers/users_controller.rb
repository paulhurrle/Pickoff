class UsersController < ApplicationController
    def show
        if current_user
            @user = current_user
#            flash[:notice] = "Welcome, #{@user.email}!"
            render :show
        else 
            redirect_to home_index_path
        end
#        @user = User.find(params[:id])
    end
end
