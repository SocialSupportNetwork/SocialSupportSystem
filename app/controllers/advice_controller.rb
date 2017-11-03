class AdviceController < ApplicationController
    skip_before_action :authenticate_user!
    def new 
        @advice = Advice.new
    end
    
    def show
        render params[:advice]
    end
    
end
