require 'test_helper'

class GalleryControllerTest < ActionController::TestCase
  test "should get showall" do
    get :showall
    assert_response :success
  end

end
