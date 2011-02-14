class EventController < ApplicationController
  
  before_filter :check_current_user, :only => [:show, :vote]
  
  def new
    @event = Event.new
  end
  
  def show
    @event = Event.find_by_url_key(params[:id])
    return redirect_to :action => 'not_found' if !@event
    
    if !current_user or !@event.people_going.include?(current_user)
      return redirect_to :action => 'invitation', :id => @event.id
    end
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
    raise "#{params['event_membership[event_id]']}"
    @event = Event.find_by_id(params['event_membership[event_id]'])
    return redirect_to :action => 'not_found' if !@event
    
    @event_membership = EventMembership.new(params[:event_membership])
    
    if !@event_membership.save
      render :action => 'invitation'
    end
    
    redirect_to :action => 'show', :id => @event.url_key
  end
  
  def event_listing
    @lunch_option = LunchOption.find(params[:id])
    render :layout => false
  end
  
  def vote
    @lunch_option = LunchOption.find_by_id(params[:lunch_option_id])
    @user = User.find_by_id(params[:user_id])
    @value = Integer(params[:value])
    @result = ""
    
    if !@lunch_option
      @result = "no-lunch-option"
      return render :layout => false
    end
    
    if !@user
      @result = 'no-user'
      return render :layout => false
    end
    
    existing_vote = Vote.find_by_lunch_option_id_and_user_id(@lunch_option.id, @user.id)
    if existing_vote
      @result = "existing" 
      return render :layout => false
    end
    
    @vote = Vote.create(:user_id => @user.id, :lunch_option_id => @lunch_option.id, :value => @value)
    @result = "ok"
    return render :layout => false
  end
  
  def not_found
    
  end
  
private
  
  def check_current_user
    return if !current_user.nil?
      
    redirect_to :action => :invitation, :id => params[:id]
  end
  
end
