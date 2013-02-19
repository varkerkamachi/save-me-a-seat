class Passenger < ActiveRecord::Base
  attr_accessible :email, :first_name, :id, :last_name, :reservations_id
  
  has_many :reservations
end
