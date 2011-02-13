class UpdateLunchOptionReviews < ActiveRecord::Migration
  def self.up
    add_column :lunch_option_reviews, :lunch_option_id, :integer
  end

  def self.down
    remove_column :lunch_option_reviews, :lunch_option_id
  end
end
