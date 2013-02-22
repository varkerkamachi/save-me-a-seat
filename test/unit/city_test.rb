require 'test_helper'

class CityTest < ActiveSupport::TestCase
  
  def setup
    @noname_city = City.new(:state_id=>2, :country_id=>186, :name=>"")
    @nostateid_city = City.new(:state_id=>"", :country_id=>186, :name=>"New City")
    @nocountryid_city = City.new(:state_id=>2, :country_id=>"", :name=>"New City")
  end

  test "Named scope limit" do
    @twocities = City.limit(2)
    assert_equal(City.all(:limit=>2).size, @twocities.size)
  end

  test "Named scope begins with letter" do
    @citiesA = City.begins_with_letter('A')
    assert_equal(City.all(:limit=>5).size, @citiesA.size)
  end
  
  test "shouldn't save without a name" do
    assert !@noname_city.save
  end
  
  test "shouldn't save without a country id" do
    assert !@nocountryid_city.save
  end

  test "shouldn't save without a state id" do
    assert !@nostateid_city.save
  end
  
end



