module Yelp
  class Category < ActiveRecord::Base
  
    set_table_name 'yelp_categories'
    
    LEVEL_ONE_STRING = "* "
    LEVEL_TWO_STRING = "      o "
    LEVEL_THREE_STRING = "            + "
  
    def Category.read_categories
      file = File.open('categories.txt', "r")
      
      last_level_one = nil
      last_level_two = nil
    
      while (line = file.gets)
        
        if line.starts_with? LEVEL_ONE_STRING
          last_level_one = category = Category.parse_line(line).save!
        elsif line.starts_with? LEVEL_TWO_STRING
          last_level_two = category = Category.parse_line(line).save!
        elsif line.starts_with? LEVEL_THREE_STRING
          
        end
      end
    end
    
    def Category.parse_line(line)
      # Removing any starting strings
      line = line.sub(LEVEL_ONE_STRING, "").sub(LEVEL_TWO_STRING, "").sub(LEVEL_THREE_STRING, "")
      
      line =~ /(.*?) \(.*\)/
      
      Category.new(:name => $1, :key => $2)
    end
    
  end
end