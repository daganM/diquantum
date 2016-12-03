require 'test_helper'

class NotionsControllerTest < ActionController::TestCase
  setup do
    @notion = notions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:notions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create notion" do
    assert_difference('Notion.count') do
      post :create, notion: { title: @notion.title }
    end

    assert_redirected_to notion_path(assigns(:notion))
  end

  test "should show notion" do
    get :show, id: @notion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @notion
    assert_response :success
  end

  test "should update notion" do
    patch :update, id: @notion, notion: { title: @notion.title }
    assert_redirected_to notion_path(assigns(:notion))
  end

  test "should destroy notion" do
    assert_difference('Notion.count', -1) do
      delete :destroy, id: @notion
    end

    assert_redirected_to notions_path
  end
end
