class UpdateLunchOptions < ActiveRecord::Migration
  def self.up
    add_column :lunch_options, :rating_img_url_small, :string
  end

  def self.down
    remove_column :lunch_options, :rating_img_url_small
  end
end
