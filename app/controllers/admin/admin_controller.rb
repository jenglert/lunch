class Admin::AdminController < ApplicationController
  
  layout 'admin'
  
  before_filter :check_permissions
  
  def index
    
  end
  
  def categories
    
  end
  
  def refresh_categories
    Yelp::Category.all.each { |cat| cat.destroy }
    Yelp::Category.read_categories
    
    return render :text => "Done"
  end
  
  def check_permissions
    authenticate_or_request_with_http_basic do |user_name, password|
      user_name == 'admin' && password == '1unchd'
    end
  end
  
end