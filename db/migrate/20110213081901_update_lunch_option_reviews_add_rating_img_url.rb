class UpdateLunchOptionReviewsAddRatingImgUrl < ActiveRecord::Migration
  def self.up
    add_column :lunch_option_reviews, :rating_img_url, :string
  end

  def self.down
    remove_column :lunch_option_reviews, :rating_img_url
  end
end
