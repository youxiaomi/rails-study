require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get welcome_create_url
    assert_response :success
  end

end
