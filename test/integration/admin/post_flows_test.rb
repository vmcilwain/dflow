require "test_helper"

class Admin::PostFlowsTest < ActionDispatch::IntegrationTest
  test "requires authentication" do
    post = create :post

    requires_authentication { get new_admin_post_path }
    
    requires_authentication do
      post admin_posts_path, params: { post: attributes_for(:post) }
    end

    requires_authentication { get edit_admin_post_path(post) }

    requires_authentication do
      put admin_post_path(post), params: { post: attributes_for(:post) }
    end

    requires_authentication { delete admin_post_path(post) }
  end
end
