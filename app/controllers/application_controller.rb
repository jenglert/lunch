# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  
  layout 'standard'
  
  def current_user
    User.find_by_id(cookies[:user_id])
  end
  helper_method :current_user

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end
