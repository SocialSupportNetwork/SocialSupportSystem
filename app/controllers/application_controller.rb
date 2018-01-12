class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  before_action :canTalk?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i(display_name))
    devise_parameter_sanitizer.permit(:sign_up, keys: %i(screening))
    devise_parameter_sanitizer.permit(:sign_up, keys: %i(minimum_age))
    devise_parameter_sanitizer.permit(:sign_up, keys: %i(terms_of_service))
    
    devise_parameter_sanitizer.permit(:account_update, keys: %i(display_name))
    devise_parameter_sanitizer.permit(:account_update, keys: %i(screening))
    devise_parameter_sanitizer.permit(:account_update, keys: %i(minimum_age))
    devise_parameter_sanitizer.permit(:account_update, keys: %i(terms_of_service))
    
  end

  before_action :store_current_location, unless: :devise_controller?
  helper_method :back_url

  private

  def store_current_location
    store_location_for(:user, request.url)
  end

  def after_sign_out_path_for(resource)
    stored_location_for(:user) || (respond_to?(:root_path) ? root_path : thredded.root_path)
  end
  
  def after_sign_in_path_for(resource)
    if resource.is_a?(User) && !resource.canTalk
      sign_out resource
      flash[:error] = "You have been banned!"
      root_path
    else
      super
    end 
  end 

  def back_url
    session[:user_return_to] || (respond_to?(:root_path) ? root_path : thredded.root_path)
  end
  
  def deny_banned
    if current_user.!canTalk?
        redirect_to root_path, :notice => "You are banned from this site."
    end 
  end 
  
  def canTalk?
    if current_user.present? && !current_user.canTalk
      sign_out current_user
      flash[:error] = "This account is banned!"
      root_path
    end 
  end 
  
end
