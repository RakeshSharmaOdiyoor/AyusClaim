class SitesController < ApplicationController
 before_action :authenticate_user!
 layout 'site' 	
	
  def index
  	redirect_to new_user_session_path
  end
end
