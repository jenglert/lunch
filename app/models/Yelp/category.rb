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
    
      while line = file.gets
        
        if line.starts_with? LEVEL_ONE_STRING
          last_level_one = Category.parse_line(line, nil)
          last_level_one.save!
        elsif line.starts_with? LEVEL_TWO_STRING
          raise "Unable to find last level one" if !last_level_one
          last_level_two = Category.parse_line(line, last_level_one.id)
          last_level_two.save!
        elsif line.starts_with? LEVEL_THREE_STRING
          raise "Unable to find last level two" if !last_level_two
          Category.parse_line(line, last_level_two.id).save!
        else
          raise "Unable to find line: '#{line}'"
        end
      end
    end
    
    def Category.parse_line(line, parent_category_id)
      # Removing any starting strings
      line = line.sub(LEVEL_ONE_STRING, "").sub(LEVEL_TWO_STRING, "").sub(LEVEL_THREE_STRING, "")
      
      line =~ /(.*?) \((.*)\)/
      
      category = Category.new(:name => $1.strip, :key => $2.strip)
      if parent_category_id
        category.parent_category_id = parent_category_id
      end
      category
    end
    
  end
end