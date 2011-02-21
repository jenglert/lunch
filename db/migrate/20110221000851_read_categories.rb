class ReadCategories < ActiveRecord::Migration
  def self.up
    Yelp::Category.all.each { |cat| cat.destroy }
    Yelp::Category.read_categories
  end

  def self.down
  end
end
