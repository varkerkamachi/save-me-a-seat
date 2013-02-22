require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  
  def setup
    @nocityid = Location.new(:state_id=>2, :country_id=>186, :city_id=>"")
    @nostateid = Location.new(:state_id=>"", :country_id=>186, :city_id=>2)
    @nocountryid = Location.new(:state_id=>2, :country_id=>"", :city_id=>2)
  end

  
  test "shouldn't save without a city id" do
    assert !@nocityid.save
  end
  
  test "shouldn't save without a country id" do
    assert !@nocountryid.save
  end

  test "shouldn't save without a state id" do
    assert !@nostateid.save
  end
  
end



