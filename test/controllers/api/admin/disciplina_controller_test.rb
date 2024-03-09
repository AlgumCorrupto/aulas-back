require "test_helper"

class Api::Admin::DisciplinaControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get api_admin_disciplina_show_url
    assert_response :success
  end

  test "should get create" do
    get api_admin_disciplina_create_url
    assert_response :success
  end

  test "should get index" do
    get api_admin_disciplina_index_url
    assert_response :success
  end
end
