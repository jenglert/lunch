class Admin::EventController < ApplicationController
  
  layout 'admin'
  
  before_filter :check_permissions
  
  def index
    @events = Event.find(:all, :include => :request_logs, :order => "created_at")
  end
  
  def request_logs
    @event = Event.find_by_id(params[:id])
  end
  
end