class City < ActiveRecord::Base
  attr_accessible :id, :name, :country_id, :state_id
  
  validates_presence_of :name, :country_id, :state_id
  
  scope :limit, lambda { |n| { :limit => n } }  
  scope :begins_with_letter, lambda {|letter| {:conditions => ["substr(`name`, 1, 1) = ?", letter]} }
  
end
