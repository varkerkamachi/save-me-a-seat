class Reservation < ActiveRecord::Base
  attr_accessible :location_start_id, :location_end_id, :passengers, :departure_date, :return_date, :id
  
  belongs_to :passenger
  belongs_to :location_start, :class_name => Location, :foreign_key => "location_start_id"
  belongs_to :location_end, :class_name => Location, :foreign_key => "location_end_id"
  
end
