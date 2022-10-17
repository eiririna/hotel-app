class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  include Pundit::Authorization

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name email])
  end

  rescue_from Pundit::NotAuthorizedError do |_exception|
    flash[:notice] = 'Log in as an administrator to have access to the page'
    redirect_to root_path
  end
end
