require 'test_helper'

class CountryTest < ActiveSupport::TestCase
  
  def setup
    @noname_country = Country.new(:name=>"")
  end

  test "Named scope begins with letter" do
    @countriesA = Country.begins_with_letter('A')
    assert_equal(Country.all(:limit=>11).size, @countriesA.size)
  end

  test "Named scope limit" do
    @twocountries = Country.limit(2)
    assert_equal(Country.all(:limit=>2).size, @twocountries.size)
  end
  
  test "shouldn't save without a name" do
    assert !@noname_country.save
  end
  
end



