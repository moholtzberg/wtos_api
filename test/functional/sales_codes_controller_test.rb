require 'test_helper'

class SalesCodesControllerTest < ActionController::TestCase
  setup do
    @sales_code = sales_codes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sales_codes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sales_code" do
    assert_difference('SalesCode.count') do
      post :create, sales_code: {  }
    end

    assert_redirected_to sales_code_path(assigns(:sales_code))
  end

  test "should show sales_code" do
    get :show, id: @sales_code
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sales_code
    assert_response :success
  end

  test "should update sales_code" do
    put :update, id: @sales_code, sales_code: {  }
    assert_redirected_to sales_code_path(assigns(:sales_code))
  end

  test "should destroy sales_code" do
    assert_difference('SalesCode.count', -1) do
      delete :destroy, id: @sales_code
    end

    assert_redirected_to sales_codes_path
  end
end
