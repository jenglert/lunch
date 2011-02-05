class CreateLunchOptions < ActiveRecord::Migration
  def self.up
    create_table :lunch_options do |t|
      t.string :name
      t.string :link
      t.string :address

      t.timestamps
    end
  end

  def self.down
    drop_table :lunch_options
  end
end
