require 'test_helper'

class CoRegValuesControllerTest < ActionController::TestCase
  setup do
    @co_reg_value = co_reg_values(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:co_reg_values)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create co_reg_value" do
    assert_difference('CoRegValue.count') do
      post :create, co_reg_value: {  }
    end

    assert_redirected_to co_reg_value_path(assigns(:co_reg_value))
  end

  test "should show co_reg_value" do
    get :show, id: @co_reg_value
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @co_reg_value
    assert_response :success
  end

  test "should update co_reg_value" do
    put :update, id: @co_reg_value, co_reg_value: {  }
    assert_redirected_to co_reg_value_path(assigns(:co_reg_value))
  end

  test "should destroy co_reg_value" do
    assert_difference('CoRegValue.count', -1) do
      delete :destroy, id: @co_reg_value
    end

    assert_redirected_to co_reg_values_path
  end
end
