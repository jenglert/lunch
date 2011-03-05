class RequestLog < ActiveRecord::Base
  
  validates_presence_of :event_id
  
  belongs_to :event
end
