
class UsersController < ApplicationController 
before_action :deny_banned

    def show
        @user = User.find(params[:id])
    end
    
    def block_user
        #check if they are an admin before allowing them to block
        if current_user.admin
            userID = params[:id]
            modID = current_user.thredded_user_detail.user_id
            @user = User.find_by(id: userID)
            @user_detail = @user.thredded_user_detail 
            @user.update_attribute(:canTalk, 'false')
            @user_detail.update_attribute(:moderation_state, 3)
            @user_detail.update_attribute(:moderation_id, modID)
            redirect_to "/forum/admin/moderation/users/#{userID}" # , :notice => "#{@user.username} has been successfully banned"
        else
            redirect_to "/forum", :notice => "Something went wrong while trying to ban user"
        end
    end
    
    protected
    def deny_banned
        if current_user.canTalk == false
            redirect_to root_path, :notice => "You are banned from this site."
        end 
    end 
    

end
