require 'test_helper'

class Admin::SearchControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get admin_search_search_url
    assert_response :success
  end

end
