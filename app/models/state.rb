class State < ActiveRecord::Base
  attr_accessible :id, :name, :country_id
  
  belongs_to :country
  has_many :cities
  
  validates_presence_of :name, :country_id
  
  scope :limit, lambda { |n| { :limit => n } }  
  scope :begins_with_letter, lambda {|letter| {:conditions => ["substr(`name`, 1, 1) = ?", letter]} }
  scope :from_city, lambda {|s| {:conditions => ["id = ?", s]} }
  
end
