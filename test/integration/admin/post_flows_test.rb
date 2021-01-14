require "test_helper"

class Admin::PostFlowsTest < ActionDispatch::IntegrationTest
  test "requires authentication" do
    post = create :post

    requires_authentication { get admin_posts_path }
    
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

  test "as an administrator, I can view a list of posts" do
    sign_in admin_user

    get "/admin/posts"
    assert_response :success
  end

  test "as a administrator, I can create a Post" do
    sign_in admin_user

    get "/admin/posts/new"
    assert_response :success

    post "/admin/posts", params: { post: attributes_for(:post) }

    assert_response :redirect
    assert_redirected_to edit_admin_post_path(Post.last)
    follow_redirect!
    assert_response :success
    assert flash[:success].present?
  end

  test "as an administrator, I am presented with errors when creating a Post fails" do
    sign_in admin_user

    post "/admin/posts", params: { post: attributes_for(:post, content: nil) }
    assert_response :ok
    assert_template :new
    assert flash[:error].present?
  end
end
