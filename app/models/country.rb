class Country < ActiveRecord::Base
  attr_accessible :id, :name
  
  has_many :states
  has_many :cities
  
  validates_presence_of :name
  
  scope :limit, lambda { |n| { :limit => n } }  
  scope :begins_with_letter, lambda {|letter| {:conditions => ["substr(`name`, 1, 1) = ?", letter]} }
    
end
