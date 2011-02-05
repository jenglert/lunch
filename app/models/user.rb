class User < ActiveRecord::Base
  
  has_many :event_memberships
  has_many :events, :through => :event_memberships

  def User.create_user(cookies, name)
    user = User.create(:name => name)
    cookies[:user_id] = { :value => user.id, :expires_at => 20.years.from_now }
    
    user
  end
  
end
