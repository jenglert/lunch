class CreateLunchOptions < ActiveRecord::Migration
  def self.up
    create_table :lunch_options do |t|
      t.string :name
      t.string :link
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.double :distance
      t.string :photo_url
      t.double :avg_rating
      t.double :latitude
      t.double :longitude
      t.string :photo_url_small
      t.boolean :is_closed

      t.timestamps
    end
  end

  def self.down
    drop_table :lunch_options
  end
end
