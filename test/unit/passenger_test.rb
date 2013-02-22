require 'test_helper'

class PassengerTest < ActiveSupport::TestCase
  
  def setup
    @nofname = Passenger.new(:reservations_id=>2, :first_name=>"", :last_name=>"Lastie", :email=>"myemail@email.com")
    @nolname = Passenger.new(:reservations_id=>2, :first_name=>"Bob", :last_name=>"", :email=>"myemail@email.com")
    @noresid = Passenger.new(:reservations_id=>"", :first_name=>"Bob", :last_name=>"Lastie", :email=>"myemail@email.com")
    @noemail = Passenger.new(:reservations_id=>2, :first_name=>"Bob", :last_name=>"Lastie", :email=>"")
  end

  test "Named scope limit" do
    @twopass = Passenger.limit(2)
    assert_equal(Passenger.all(:limit=>2).size, @twopass.size)
  end

  test "Named scope first name begins with" do
    @fnameA = Passenger.first_name_begins_with('A')
    assert_equal(Passenger.all(:limit=>1).size, @fnameA.size)
  end
  
  test "shouldn't save without a first name" do
    assert !@nofname.save
  end
  
  test "shouldn't save without a last name" do
    assert !@nolname.save
  end
  
  test "shouldn't save without a reservations id" do
    assert !@noresid.save
  end

  test "shouldn't save without an email" do
    assert !@noemail.save
  end
  
end



