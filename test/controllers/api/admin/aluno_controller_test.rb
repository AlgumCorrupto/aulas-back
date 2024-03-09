require "test_helper"

class Api::Admin::AlunoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_admin_aluno_index_url
    assert_response :success
  end
end
