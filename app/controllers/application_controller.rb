class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :authenticate_user! , :except => [:create, :new]
  # protect_from_forgery with: :exception

  protected

  def after_sign_in_path_for(resource)
    if current_user.admin?
      claims_path
    else
      claims_path
    end
  end

end
