class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :url_key
      t.timestamp :when
      t.integer :organizer_id
      t.string :name
      t.string :description
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.decimal :radius

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
