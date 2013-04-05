require 'test_helper'

class NewsControllerTest < ActionController::TestCase
  test "should get showall" do
    get :showall
    assert_response :success
  end

  test "should get add" do
    get :add
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get edit" do
    get :edit
    assert_response :success
  end

end
