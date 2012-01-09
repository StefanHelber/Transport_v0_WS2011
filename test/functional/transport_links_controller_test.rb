require 'test_helper'

class TransportLinksControllerTest < ActionController::TestCase
  setup do
    @transport_link = transport_links(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:transport_links)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create transport_link" do
    assert_difference('TransportLink.count') do
      post :create, transport_link: @transport_link.attributes
    end

    assert_redirected_to transport_link_path(assigns(:transport_link))
  end

  test "should show transport_link" do
    get :show, id: @transport_link.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @transport_link.to_param
    assert_response :success
  end

  test "should update transport_link" do
    put :update, id: @transport_link.to_param, transport_link: @transport_link.attributes
    assert_redirected_to transport_link_path(assigns(:transport_link))
  end

  test "should destroy transport_link" do
    assert_difference('TransportLink.count', -1) do
      delete :destroy, id: @transport_link.to_param
    end

    assert_redirected_to transport_links_path
  end
end
