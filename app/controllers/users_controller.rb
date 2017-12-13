
class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
    end
    
    def blockUser
       @user.canTalk = false 
    end
end
