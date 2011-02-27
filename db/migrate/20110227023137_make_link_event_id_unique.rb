class MakeLinkEventIdUnique < ActiveRecord::Migration
  def self.up
    
    LunchOption.all.each { |lo| lo.destroy }
    ActiveRecord::Base.connection.execute("create unique index lunchoption_event_id_link_uidx on lunch_options(event_id, link)")
  end

  def self.down
  end
end
