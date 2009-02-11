require 'test_helper'

class NumberingRulesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:numbering_rules)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create numbering_rule" do
    assert_difference('NumberingRule.count') do
      post :create, :numbering_rule => { }
    end

    assert_redirected_to numbering_rule_path(assigns(:numbering_rule))
  end

  test "should show numbering_rule" do
    get :show, :id => numbering_rules(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => numbering_rules(:one).id
    assert_response :success
  end

  test "should update numbering_rule" do
    put :update, :id => numbering_rules(:one).id, :numbering_rule => { }
    assert_redirected_to numbering_rule_path(assigns(:numbering_rule))
  end

  test "should destroy numbering_rule" do
    assert_difference('NumberingRule.count', -1) do
      delete :destroy, :id => numbering_rules(:one).id
    end

    assert_redirected_to numbering_rules_path
  end
end
