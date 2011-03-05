class CreateRequestLogs < ActiveRecord::Migration
  def self.up
    create_table :request_logs do |t|

      t.text    :body
      t.integer :response_code

      t.timestamps
    end
  end

  def self.down
    drop_table :request_logs
  end
end
