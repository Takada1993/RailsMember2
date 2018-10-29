class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def after_sign_in_path_for(resource)
    article_top_path
  end
  
  def after_sign_out_path_for(resource)
    article_top_path
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end
    
    private
        def sign_in_required
            redirect_to new_user_session_url unless user_signed_in?
        end
end
