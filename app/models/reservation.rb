class Reservation < ActiveRecord::Base
  attr_accessible :location_start_id, :location_end_id, :passengers, :departure_date, :return_date, :id
  
  belongs_to :passenger
  belongs_to :location_start, :class_name => Location, :foreign_key => "location_start_id"
  belongs_to :location_end, :class_name => Location, :foreign_key => "location_end_id"
  
  validates_presence_of :location_start_id, :location_end_id, :passengers, :departure_date, :return_date
  validate :departure_date_before_return_date
  
  scope :departure_previous_to, lambda { |n| {:conditions => ["departure_date < ?", n]} }
  scope :return_previous_to, lambda { |n| {:conditions => ["return_date < ?", n]} }
  scope :departure_after, lambda { |n| {:conditions => ["departure_date > ?", n]} }
  scope :return_after, lambda { |n| {:conditions => ["return_date > ?", n]} }
  
  def departure_date_before_return_date
    if departure_date && return_date and departure_date > return_date
      errors.add(:departure_date, "cannot be greater than the return date")
    end
  end
  
end
