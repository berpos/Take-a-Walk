class ApplicationController < ActionController::Base
  before_action :authenticate_user! # TODO: only in checkout
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    # TODO: ADD THE OTHER PARAMETERS HERE AND MIGRATION
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name phone_number company_name address photo])

    # For additional in app/views/devise/registrations/edit.html.erb
    # TODO: ADD THE OTHER PARAMETERS AND MIGRATION
    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name phone_number company_name address photo])
  end

  def home
  end
end
