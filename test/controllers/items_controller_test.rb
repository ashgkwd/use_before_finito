require "test_helper"

class ItemsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @user = users(:one)
    sign_in @user
  end

  test "does not create an item when expired_at is not provided" do
    assert_no_difference("Item.count") do
      post items_url, params: { item: { expired_at: nil, name: :dummy } }
      assert_response :unprocessable_entity
    end
  end

  test "does not create an item when name is not provided" do
    assert_no_difference("Item.count") do
      post items_url, params: { item: { name: nil, expired_at: Date.today } }
      assert_response :unprocessable_entity
    end
  end

  test "creates an item" do
    assert_difference("Item.count") do
      post items_url, params: { item: { expired_at: Date.today, name: :dummy } }
      assert_redirected_to items_path
    end
  end
end
