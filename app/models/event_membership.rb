class EventMembership < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :event
  
  attr_accessor :your_name
end
