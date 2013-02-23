require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  def setup
    @controller = HomeController.new
  end

  test "HTTP request" do
    get :index
    assert_response :success
  end
  
  test "valid page layout" do
    get :index
    assert_template(expected = 'application')
  end
end