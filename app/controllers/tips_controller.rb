class TipsController < ApplicationController
  
  def index
    @tips = Tip.search(params[:term])
    @tip = Tip.new
  end

  def new
    @tips = Tip.all
    @tip = Tip.new
  end

  def create
    @tip = Tip.new(tip_params)
    if @tip.save
        redirect_to "/tips", alert: "Advice submitted! It will be visible after its been reviewed by a moderator. Check back soon!"
    else
        redirect_to "/tips", alert: "Error submitting advice."
        # maybe change to new_user_path
    end
  end

  def show
    @tips = Tip.find(params[:id])
  end
  # params[:id] 
  
  def destroy
    if current_user.admin
      @tips = Tip.find(params[:id])
      @tips.destroy
      redirect_to "/tip-moderation", notice: "Tip deleted successfully."
    else
      redirect_to "/tips", alert: "An error occurred while trying to delete tip."
    end
  end
  
  def update
    # run_callbacks(:approve) do
    if current_user.admin
        @tips = Tip.find(params[:id])
        @tips.update_attribute(:approved, 'true')
        redirect_to "/tip-moderation", notice: "Tip approved successfully."
    else
      redirect_to "/tips", alert: "An error occurred while trying to approve tip."
    end
  end
  
  def moderation
    @tips = Tip.all
  end
  
  def tip_params
    params.require(:tip).permit(:title, :body, :topic_id, :subtopic_id, :term)
  end
end
