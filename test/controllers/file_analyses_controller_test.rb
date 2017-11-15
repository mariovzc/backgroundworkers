require 'test_helper'

class FileAnalysesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get file_analyses_new_url
    assert_response :success
  end

  test "should get show" do
    get file_analyses_show_url
    assert_response :success
  end

end
