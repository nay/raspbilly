require 'test_helper'

class NumberingResetTypesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:numbering_reset_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create numbering_reset_type" do
    assert_difference('NumberingResetType.count') do
      post :create, :numbering_reset_type => { }
    end

    assert_redirected_to numbering_reset_type_path(assigns(:numbering_reset_type))
  end

  test "should show numbering_reset_type" do
    get :show, :id => numbering_reset_types(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => numbering_reset_types(:one).id
    assert_response :success
  end

  test "should update numbering_reset_type" do
    put :update, :id => numbering_reset_types(:one).id, :numbering_reset_type => { }
    assert_redirected_to numbering_reset_type_path(assigns(:numbering_reset_type))
  end

  test "should destroy numbering_reset_type" do
    assert_difference('NumberingResetType.count', -1) do
      delete :destroy, :id => numbering_reset_types(:one).id
    end

    assert_redirected_to numbering_reset_types_path
  end
end
