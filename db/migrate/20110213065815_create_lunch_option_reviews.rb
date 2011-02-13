class CreateLunchOptionReviews < ActiveRecord::Migration
  def self.up
    create_table :lunch_option_reviews do |t|
      t.string :yelp_id
      t.string :text_excerpt
      t.string :url
      t.string :user_name
      t.string :user_photo_url
      t.string :user_photo_url_small
      t.decimal :rating
      t.string :mobile_url
      t.string :user_url
      t.string :date
      
      t.timestamps
    end    
  end

  def self.down
    drop_table :lunch_option_reviews   
  end
end
