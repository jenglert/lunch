class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :url
      t.timestamp :time
      t.integer :organizer_id
      t.string :name
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
