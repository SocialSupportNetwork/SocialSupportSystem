class TipsController < ApplicationController
  
  def index
    @tips = Tip.all
  end

  def new
    @tip = Tip.new
  end

  def create
    @tip = Tip.new(tip_params)
    if @tip.save
        redirect_to "/", alert: "Advice submitted successfully."
    else
        redirect_to new_tip_path, alert: "Error submitting advice."
        # maybe change to new_user_path
    end
  end

  def show
    @tips = Tip.find(params[:id])
  end
  # params[:id] 
  
  def tip_params
    params.require(:tip).permit(:title, :body, :subject)
  end
end
