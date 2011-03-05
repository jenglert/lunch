class AddExecluded2 < ActiveRecord::Migration
  def self.up
    Yelp::Category.find(:all, :conditions => ["key in (?)", ['brasseries', 'breakfast_brunch', 'creperies', 'fondue', 'gastropubs', 'gluten_free', 'raw_food']]).each do |cat|
      cat.update_attribute(:excluded, true)
    end
  end

  def self.down
  end
end
