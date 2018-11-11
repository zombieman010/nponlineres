require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "np.com"
  end
  test "should get root/home" do
    get root_path
    assert_response :success
    assert_select "title", "Home | #{@base_title}"
  end

  test "should get projects" do
    get projects_path
    assert_response :success
    assert_select "title", "Projects | #{@base_title}"
  end

  test "should get resume" do
    get resume_path
    assert_response :success
    assert_select "title", "Resume | #{@base_title}"
  end

end
