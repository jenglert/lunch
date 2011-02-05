class EventController < ApplicationController
  
  def new
    @event = Event.new
  end
  
  def show
    @event = Event.find_by_url_key(params[:id])
    return redirect_to :action => 'not_found' if !@event
  end
  
  def create
    @event = Event.new(params[:event])
    
    user = User.create_user(cookies, @event.your_name)
    @event.organizer_id = user.id
    
    if @event.save
      return redirect_to :action => 'send_invites', :id => @event.url_key
    end
    
    render :action => 'new'
  end
  
  def send_invites
    @event = Event.find_by_url_key(params[:id])
    return redirect_to :action => 'not_found' if !@event
  end
  
  def invitation
    @event = Event.find_by_url_key(params[:id])
    return redirect_to :action => 'not_found' if !@event
    @event_membership = EventMembership.new
  end
  
  def attend_event
    @event = Event.find_by_url_key(params[:id])
    return redirect_to :action => 'not_found' if !@event
    
    @event_membership = EventMembership.new(params[:event])
    
    if !@event_membership.save
      render :action => 'invitation'
    end
    
    redirect_to :action => 'show', :id => @event.url_key
  end
  
  def not_found
    
  end
  
end
