require 'test_helper'

class SinksControllerTest < ActionController::TestCase
  setup do
    @sink = sinks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sinks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sink" do
    assert_difference('Sink.count') do
      post :create, sink: @sink.attributes
    end

    assert_redirected_to sink_path(assigns(:sink))
  end

  test "should show sink" do
    get :show, id: @sink.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sink.to_param
    assert_response :success
  end

  test "should update sink" do
    put :update, id: @sink.to_param, sink: @sink.attributes
    assert_redirected_to sink_path(assigns(:sink))
  end

  test "should destroy sink" do
    assert_difference('Sink.count', -1) do
      delete :destroy, id: @sink.to_param
    end

    assert_redirected_to sinks_path
  end
end
