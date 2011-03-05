class AddExecluded < ActiveRecord::Migration
  def self.up
    add_column :yelp_categories, :excluded, :boolean
  end

  def self.down
  end
end
