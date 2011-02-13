class UpdateLunchOptionsWithReviewCount < ActiveRecord::Migration
  def self.up
    add_column :lunch_options, :review_count, :integer
  end

  def self.down
    remove_column :lunch_options, :review_count, :integer
  end
end
