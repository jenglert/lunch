class CreateLunchOptions < ActiveRecord::Migration
  def self.up
    create_table :lunch_options do |t|
      t.string :name
      t.string :link
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.decimal :distance
      t.string :photo_url
      t.decimal :avg_rating
      t.decimal :latitude
      t.decimal :longitude
      t.string :photo_url_small
      t.boolean :is_closed
      t.integer :event_id
      t.integer :phone

      t.timestamps
    end
  end

  def self.down
    drop_table :lunch_options
  end
end
