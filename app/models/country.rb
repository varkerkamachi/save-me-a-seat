class Country < ActiveRecord::Base
  attr_accessible :id, :name
  
  has_many :states
  has_many :cities
  
end
