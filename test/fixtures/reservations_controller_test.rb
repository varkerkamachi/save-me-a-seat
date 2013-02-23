require 'test_helper'

class ReservationsControllerTest < ActionController::TestCase
  def setup
    @controller = ReservationsController.new
  end

  test "HTTP request" do
    get :index
    assert_response :success
    get( :show, {:id => 1} )
    assert_response :success
  end
  
  test "valid page layout" do
    get :index
    assert_template(expected = 'application')
  end
end