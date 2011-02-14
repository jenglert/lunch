# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def states_for_select
    State::NAMES.map{ |arr| [arr.second, arr.second] } 
  end
  
  def radius_for_select
    [[0.5, 0.5], [1, 1], [3, 3], [5,5], [15, 15]]
  end
end
