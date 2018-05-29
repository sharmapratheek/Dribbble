require 'test_helper'

class ShotsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get shots_index_url
    assert_response :success
  end

  test "should get show" do
    get shots_show_url
    assert_response :success
  end

  test "should get new" do
    get shots_new_url
    assert_response :success
  end

  test "should get edit" do
    get shots_edit_url
    assert_response :success
  end

end
