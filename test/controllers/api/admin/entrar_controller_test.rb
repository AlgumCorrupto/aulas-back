require "test_helper"

class Api::Admin::EntrarControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get api_admin_entrar_show_url
    assert_response :success
  end
end
