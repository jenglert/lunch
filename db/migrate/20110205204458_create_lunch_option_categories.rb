class CreateLunchOptionCategories < ActiveRecord::Migration
  def self.up
    create_table :lunch_option_categories do |t|
      t.string :name
      t.integer :lunch_option_id

      t.timestamps
    end
  end

  def self.down
    drop_table :lunch_option_categories
  end
end
