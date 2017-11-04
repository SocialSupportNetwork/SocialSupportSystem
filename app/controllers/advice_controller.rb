class AdviceController < ApplicationController
    skip_before_action :authenticate_user!
    
    public 
    
    def new 
        super
    end
    
    def create
        @advice = Advice.new(advice_params)
        if @advice.save
            redirect_to @advice
        else
            render :new
        end
    end
    
    def advice_params
        params.require(:advice).permit(:title, :tip, :subject)
    end
    
    
    def show
        render params[:advice]
    end
    
end
