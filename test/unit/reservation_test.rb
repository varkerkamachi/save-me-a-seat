require 'test_helper'

class ReservationTest < ActiveSupport::TestCase

  def setup
    @nostartid = Reservation.new(:location_start_id=>"", :location_end_id=>4, :passengers=>2, :departure_date=>"2012-01-01 09:05:34", :return_date=>"2013-01-01 09:05:34")
    @noendid = Reservation.new(:location_start_id=>1, :location_end_id=>"", :passengers=>2, :departure_date=>"2012-01-01 09:05:34", :return_date=>"2013-01-01 09:05:34")
    @nopassengers = Reservation.new(:location_start_id=>3, :location_end_id=>4, :passengers=>"", :departure_date=>"2012-01-01 09:05:34", :return_date=>"2013-01-01 09:05:34")
    @nodepart = Reservation.new(:location_start_id=>1, :location_end_id=>4, :passengers=>2, :departure_date=>"", :return_date=>"2013-01-01 09:05:34")
    @noreturn = Reservation.new(:location_start_id=>1, :location_end_id=>4, :passengers=>2, :departure_date=>"2012-01-01 09:05:34", :return_date=>"")
    @baddates = Reservation.new(:location_start_id=>1, :location_end_id=>4, :passengers=>2, :departure_date=>"2012-01-01 09:05:34", :return_date=>"2010-01-01 09:05:34")
  end

  
  test "shouldn't save without the proper information" do
    assert !@nostartid.save
    assert !@noendid.save
    assert !@nopassengers.save
    assert !@nodepart.save
    assert !@noreturn.save
  end
  
  test "shouldn't save if the dates are out of chronology" do
    assert !@baddates.save
  end
  
  test "Reservation departure is before date" do
    @dep = Reservation.departure_previous_to('2012-12-17 14:09:27')
    assert_equal( Reservation.all(:limit=>1).size, @dep.size)
  end
  test "Reservation departure is after date" do
    @dep = Reservation.departure_after('2010-01-01 09:05:34')
    assert_equal( Reservation.all.size, @dep.size)
  end
  
  test "Reservation return is before date" do
    @ret = Reservation.return_previous_to('2012-12-25 10:09:50')
    assert_equal( Reservation.all(:limit=>1).size, @ret.size)
  end
  test "Reservation return is after date" do
    @ret = Reservation.return_after('2010-01-01 09:05:34')
    assert_equal( Reservation.all.size, @ret.size)
  end
  # scope :departure_previous_to, lambda { |n| {:conditions => ["where departure_date < ?", n]} }
  # scope :return_previous_to, lambda { |n| {:conditions => ["where return_date < ?", n]} }
  # scope :departure_after, lambda { |n| {:conditions => ["where departure_date > ?", n]} }
  # scope :return_after, lambda { |n| {:conditions => ["where return_date > ?", n]} }
  
end



