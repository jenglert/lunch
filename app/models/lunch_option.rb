class LunchOption < ActiveRecord::Base
  belongs_to :event
  has_many :categories, :class_name => "LunchOptionCategory", :foreign_key => "lunch_option_id"
end
