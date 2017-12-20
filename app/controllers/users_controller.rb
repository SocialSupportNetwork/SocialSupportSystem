
class UsersController < ApplicationController
before_action :deny_banned

    def show
        @user = User.find(params[:id])
    end
    
    def block_user
        #check if they are an admin before allowing them to block
        if current_user.admin
            userID = params[:id]
            User.update(userID, :canTalk => 'false') 
            redirect_to('/forum')
        else
            redirect_to('/forum')
        end
    end
    
    protected
    def deny_banned
        if current_user.canTalk == false
            redirect_to root_path, :notice => "You are banned from this site."
        end 
    end 
    

end
