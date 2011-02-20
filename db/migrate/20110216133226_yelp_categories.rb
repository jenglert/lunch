class YelpCategories < ActiveRecord::Migration
  def self.up
    create_table :yelp_categories do |t|
      t.string  :name
      t.string  :key
      t.integer :parent_category_id

      t.timestamps
    end
  end

  def self.down
    drop_table :yelp_categories
  end
end
