
class UsersController < ApplicationController
before_filter :deny_banned
    
    def show
        @user = User.find(params[:id])
    end
    
    protected
    def deny_banned
        if current_user.!canTalk?
            redirect_to root_path, :notice => "You are banned from this site."
        end 
    end 
end
