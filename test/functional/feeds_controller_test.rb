require 'test_helper'

class FeedsControllerTest < ActionController::TestCase
  setup do
    @feed = feeds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:feeds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create feed" do
    assert_difference('Feed.count') do
      post :create, params: { feed: { etag: @feed.etag, last_fetched_at: @feed.last_fetched_at, name: @feed.name, url: @feed.url } }
    end

    assert_redirected_to feed_path(assigns(:feed))
  end

  test "should show feed" do
    get :show, params: { id: @feed }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { id: @feed }
    assert_response :success
  end

  test "should update feed" do
    put :update, params: { id: @feed, feed: { etag: @feed.etag, last_fetched_at: @feed.last_fetched_at, name: @feed.name, url: @feed.url } }
    assert_redirected_to feed_path(assigns(:feed))
  end

  test "should destroy feed" do
    assert_difference('Feed.count', -1) do
      delete :destroy, params: { id: @feed }
    end

    assert_redirected_to feeds_path
  end
end
