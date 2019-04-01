require 'test_helper'

class PhotographyControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get photography_index_url
    assert_response :success
  end

end
