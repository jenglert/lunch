require 'curl' 

class Event < ActiveRecord::Base

  has_many :event_memberships
  has_many :users, :through => :event_memberships
  belongs_to :organizer, :class_name => "User", :foreign_key => 'organizer_id'
  
  attr_accessor :your_name

  before_validation :create_url
  after_save :populate_options

  validates_uniqueness_of :url_key
  validates_presence_of :url_key, :organizer_id, :name, :description, :address, :city, :state, :zip
  
  def share_url(request)
    "http://#{request.host}#{request.port ? ':' + request.port.to_s : ''}/event/show/#{url_key}"
  end
  
  def people_going
    [organizer] + users
  end
  
  def populate_options
    c = Curl::Easy.perform("http://api.yelp.com/business_review_search?location=#{URI.escape([address, city, state, zip].join(', '))}&ywsid=M0DPiz_lshtXx1M86Z729w&category=restaurants&radius=3")
    json = JSON.parse(c.body_str)
    
    json
  end
  
protected

  def create_url
    key = unique_key while !Event.find_by_url_key(key).nil?
    
    self.url_key = key
  end
  
  def unique_key
    chars = ['a'..'z'].map{|r|r.to_a}.flatten
    Array.new(6).map{chars[rand(chars.size)]}.join
  end
  
end
