# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def states_for_select
    State::NAMES
  end
  
  def current_user
    User.find_by_id(cookies[:user_id])
  end
  
  def radius_for_select
    [[0.5, 0.5], [1, 1], [3, 3], [5,5], [15, 15]]
  end
end
