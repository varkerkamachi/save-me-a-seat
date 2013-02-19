class Location < ActiveRecord::Base
  attr_accessible :city_id, :country_id, :geoX, :geoY, :id, :state_id
  
  has_many :reservations
  belongs_to :city
  belongs_to :state
  belongs_to :country
  
end
