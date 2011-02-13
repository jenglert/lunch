class LunchOption < ActiveRecord::Base
  belongs_to :event
  has_many :categories, :class_name => "LunchOptionCategory", :foreign_key => "lunch_option_id"
  
  validates_presence_of :name 
                        :address 
                        :city
                        :state
                        :zip
                        :phone
                        :distance
                        :photo_url
                        :avg_rating
                        :latitude
                        :longitude
                        :photo_url_small
                        :is_closed
                        :link
  
  def has_voted(current_user)
    !Vote.find_by_user_id_and_lunch_option_id(current_user.id, self.id).nil?
  end
  
  def votes
    [Vote.find_all_by_lunch_option_id_and_value(self.id, 1).count, Vote.find_all_by_lunch_option_id_and_value(self.id, -1).count]
  end
end
