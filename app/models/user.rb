class User < ActiveRecord::Base
  
  has_many :event_memberships
  has_many :events, :through => :event_memberships

  def User.create_user(cookies, name)
    user = User.create(:name => name)
    cookies.permanent[:user_id] = user.id
    
    user
  end
  
end
