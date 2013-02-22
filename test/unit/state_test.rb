require 'test_helper'

class StateTest < ActiveSupport::TestCase
  
  def setup
    @noname_state = State.new(:name=>"")
    @nocountryid_state = State.new(:country_id=>"", :name=>"New State")
  end

  test "Named scope begins with letter" do
    @statesA = State.begins_with_letter('A')
    assert_equal(State.all(:limit=>4).size, @statesA.size)
  end
  
  test "Named scope limit" do
    @twostates = State.limit(2)
    assert_equal(State.all(:limit=>2).size, @twostates.size)
  end
  
  test "shouldn't save without a name" do
    assert !@noname_state.save
  end
  
  test "shouldn't save without a country id" do
    assert !@nocountryid_state.save
  end
  
end



