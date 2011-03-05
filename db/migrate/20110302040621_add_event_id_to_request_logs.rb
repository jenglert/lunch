class AddEventIdToRequestLogs < ActiveRecord::Migration
  def self.up
    add_column :request_logs, :event_id, :integer
  end

  def self.down
  end
end
