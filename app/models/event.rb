require 'rubygems'
require 'curb'

class Event < ActiveRecord::Base

  has_many :event_memberships
  has_many :users, :through => :event_memberships
  has_many :lunch_options
  belongs_to :organizer, :class_name => "User", :foreign_key => 'organizer_id'
  
  attr_accessor :your_name

  before_validation :create_url
  after_save :populate_options

  validates_uniqueness_of :url_key
  validates_presence_of :url_key, :organizer_id, :name, :description, :address, :city, :state, :zip, :radius, :when
  
  def sorted_lunch_options
    sql = <<-SQL
      select lunch_options.*
        from lunch_options
        left join votes on lunch_options.id = votes.lunch_option_id
        where lunch_options.event_id = #{self.id}
        group by lunch_options.id
        order by sum(coalesce(votes.value, 0)) desc
    SQL
    
    LunchOption.find_by_sql(sql)
  end
  
  def share_url(request)
    "http://#{request.host}#{request.port ? ':' + request.port.to_s : ''}/event/show/#{url_key}"
  end
  
  def people_going
    [organizer] + users
  end
  
  def populate_options
    
    splits = Yelp::Category.category_splits(Yelp::Category.find(:all, :conditions => ["key in (?)", %w"restaurants"]), 5)
    
    urls = []
    splits.each do |split|
      urls << "http://api.yelp.com/business_review_search?location=#{URI.escape([address, city, state, zip].join(', '))}&ywsid=M0DPiz_lshtXx1M86Z729w&category=#{split.join("+")}&radius=#{radius}"
    end
    
    c = Curl::Multi.get(urls, { :follow_location => true }, { :pipeline => true }) do |easy|
    json = JSON.parse(easy.body_str)
  
    json['businesses'].each do |business|
      lunch_option = LunchOption.new(:event_id => self.id)
      lunch_option.name = business['name']
      lunch_option.address = [business['address1'], business['address2'], business['address3'], business['address4']].join(" ")
      lunch_option.city = business['city']
      lunch_option.state = business['state']
      lunch_option.zip = business['zip'] 
      lunch_option.photo_url = business['photo_url']
      lunch_option.photo_url_small = business['photo_url_small']
      lunch_option.is_closed = business['is_closed'] == "true"
      lunch_option.link = business['url']
      lunch_option.rating_img_url_small = business['rating_img_url_small']
      lunch_option.review_count = business['review_count']
    
      if (business['phone']!=(nil || ""))  
        lunch_option.phone = Integer(business['phone'])
      else
        break
      end

      if business['distance']!=(nil || "")
        lunch_option.distance = Float(business['distance'])
      else
        break
      end 

      if business['avg_rating']!=(nil || "")
        lunch_option.avg_rating = Float(business['avg_rating'])
      else
        break
      end 

      if business['latitude']!=(nil || "")
        lunch_option.latitude = Float(business['latitude'])
      else
        break
      end

      if business['longitude']!=(nil || "")
        lunch_option.longitude = Float(business['longitude'])
      else
        break
      end


      business['categories'].each do |category|
        lunch_option.categories << LunchOptionCategory.new(:name => category['name'])
      end
    
      business['reviews'].each do |review|
        lunch_option.reviews << LunchOptionReview.new(:yelp_id => review['id'],
                                                       :text_excerpt => review['text_excerpt'],
                                                       :url => review['url'],
                                                       :user_name => review['user_name'],
                                                       :user_photo_url => review['user_photo_url'],
                                                       :user_photo_url_small => review['user_photo_url_small'],
                                                       :rating => review['review'],
                                                       :rating_img_url => review['rating_img_url'],
                                                       :mobile_url => review['mobile_uri'],
                                                       :user_url => review['user_url'],
                                                       :date => review['date']
                                                      )
      end
    
      lunch_option.save!
    end
  end
  end
  
protected

  def create_url  
    self.url_key = unique_key
  end
  
  def unique_key
    chars = ['a'..'z'].map{|r|r.to_a}.flatten
    Array.new(6).map{chars[rand(chars.size)]}.join
  end
  
end
