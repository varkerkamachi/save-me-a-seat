class Passenger < ActiveRecord::Base
  attr_accessible :email, :first_name, :id, :last_name, :reservations_id
  
  has_many :reservations
  
  validates_presence_of :reservations_id, :first_name, :last_name, :email
  scope :limit, lambda { |n| { :limit => n } }  
  scope :first_name_begins_with, lambda {|letter| {:conditions => ["substr(`first_name`, 1, 1) = ?", letter]} }
  scope :last_name_begins_with, lambda {|letter| {:conditions => ["substr(`last_name`, 1, 1) = ?", letter]} }
  scope :belongs_to_reservation, lambda {|reservations_id| {:conditions => ["reservations_id = ?", reservations_id]} }
  
end
