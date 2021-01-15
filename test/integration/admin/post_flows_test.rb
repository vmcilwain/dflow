require 'test_helper'

class Admin::PostFlowsTest < ActionDispatch::IntegrationTest
  test 'requires authentication' do
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

  test 'requires authorization' do
    post = create :post

    sign_in

    requires_authorization { get admin_posts_path }
    requires_authorization { get new_admin_post_path }

    requires_authorization do
      post admin_posts_path, params: { post: attributes_for(:post) }
    end

    requires_authorization { get edit_admin_post_path(post) }

    requires_authorization do
      put admin_post_path(post), params: { post: attributes_for(:post) }
    end

    requires_authorization { delete admin_post_path(post) }
  end

  test 'as an administrator, I can view a list of posts' do
    sign_in admin_user

    get '/admin/posts'
    assert_response :success
  end

  test 'as a administrator, I can create a post' do
    sign_in admin_user

    get '/admin/posts/new'
    assert_response :success

    post '/admin/posts', params: { post: attributes_for(:post) }

    assert_response :redirect
    assert_redirected_to edit_admin_post_path(Post.last)
    follow_redirect!
    assert_response :success
    assert flash[:success].present?
  end

  test 'as an administrator, I am presented with errors when creating a post fails' do
    sign_in admin_user

    post '/admin/posts', params: { post: attributes_for(:post, content: nil) }
    assert_response :ok
    assert flash[:error].present?
  end

  test 'as a administrator, I can update a post' do
    post = create :post

    sign_in admin_user

    get "/admin/posts/#{post.id}/edit"
    assert_response :success

    put "/admin/posts/#{post.id}", params: { post: { subject: 'Test Subject' } }

    assert_response :redirect
    assert_redirected_to edit_admin_post_path(post)
    follow_redirect!
    assert_response :success
    assert flash[:success].present?
  end

  test 'as an administrator, I am presented with errors when updating a post fails' do
    post = create :post

    sign_in admin_user

    put "/admin/posts/#{post.id}", params: { post: attributes_for(:post, title: nil) }
    assert_response :ok
    assert flash[:error].present?
  end

  test 'as am administrator, I can destroy a post' do
    post = create :post

    sign_in admin_user

    delete "/admin/posts/#{post.id}"
    assert_response :redirect
    assert_redirected_to admin_posts_path
    follow_redirect!
    assert_response :success
    assert flash[:success].present?
  end
end
