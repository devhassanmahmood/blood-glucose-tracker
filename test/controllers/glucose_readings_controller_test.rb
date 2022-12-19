require "test_helper"

class GlucoseReadingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get glucose_readings_index_url
    assert_response :success
  end

  test "should get new" do
    get glucose_readings_new_url
    assert_response :success
  end
end
