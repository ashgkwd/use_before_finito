require "test_helper"

class ItemsControllerTest < ActionDispatch::IntegrationTest
  test "does not create an item when expired_at is not provided" do
    assert_no_difference("Item.count") do
      post items_url, params: { item: { expired_at: nil, name: :dummy } }
    end
  end

  test "does not create an item when name is not provided" do
    assert_no_difference("Item.count") do
      post items_url, params: { item: { name: nil, expired_at: Date.today } }
    end
  end

  test "creates an item" do
    assert_difference("Item.count") do
      post items_url, params: { item: { expired_at: Date.today, name: :dummy } }
    end
  end
end
