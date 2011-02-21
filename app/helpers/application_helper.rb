# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def shorten (string, count = 30)
  	if string.length >= count 
  		shortened = string[0, count]
  		splitted = shortened.split(/\s/)
  		words = splitted.length
  		splitted[0, words-1].join(" ") + ' ...'
  	else 
  		string
  	end
  end
  
  def states_for_select
    State::NAMES.map{ |arr| [arr.second, arr.second] } 
  end
  
  def radius_for_select
    [[0.5, 0.5], [1, 1], [3, 3], [5,5], [15, 15]]
  end
  
  def lunch_times
    [["11:00 AM", 1100],
    ["11:30 AM", 1130],
    ["12:00 AM", 1200],
    ["12:30 AM", 1230],
    ["1:00 PM", 1300],
    ["1:30 PM", 1330],
    ["2:00 PM", 1400]]
  end
end
