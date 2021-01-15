require 'test_helper'

class AboutFlowsTest < ActionDispatch::IntegrationTest
  test 'requires authentication' do
    about = create :about

    requires_authentication { get new_about_path }
    requires_authentication { get edit_about_path(about) }

    requires_authentication do
      post abouts_path,
           params: {
             about: { body: Faker::Lorem.paragraph }
           }
    end

    requires_authentication do
      put about_path(about),
          params: {
            about: { body: Faker::Lorem.paragraph }
          }
    end
  end

  test 'requires authorization' do
    about = create :about

    sign_in

    requires_authorization { get new_about_path }
    requires_authorization { get edit_about_path(about) }

    requires_authorization do
      post abouts_path,
           params: {
             about: { body: Faker::Lorem.paragraph }
           }
    end

    requires_authorization do
      put about_path(about),
          params: {
            about: { body: Faker::Lorem.paragraph }
          }
    end
  end

  test 'as a visitor, I can view the About page' do
    get '/about'
    assert_response :success
  end

  test "as an administrator, I can create an About if one doesn't exist" do
    sign_in admin_user

    get '/abouts/new'
    assert_response :success

    post '/abouts',
         params: {
           about: { body: Faker::Lorem.paragraphs(number: 3).join("\s") }
         }
    assert_response :redirect
    assert_redirected_to about_page_path
    follow_redirect!
    assert_response :success
    assert flash[:success].present?
    assert_template :about
  end

  test 'as an administrator, I am presented with errors when creating an About fails' do
    sign_in admin_user

    post '/abouts',
         params: {
           about: { body: nil }
         }
    assert_response :ok
    assert_template :new
    assert flash[:error].present?
  end

  test 'as an administrator, I can update an existing About page' do
    about = create :about

    sign_in admin_user

    get "/abouts/#{about.id}/edit"
    assert_response :success

    put "/abouts/#{about.id}",
        params: {
          about: { body: Faker::Lorem.paragraphs(number: 3).join("\s") }
        }

    assert_response :redirect
    assert_redirected_to about_page_path
    follow_redirect!
    assert_response :success
    assert flash[:success].present?
    assert_template :about
  end

  test 'as an administrator, I am presented with errors when editing an About page' do
    about = create :about

    sign_in admin_user

    put "/abouts/#{about.id}",
        params: {
          about: { body: nil }
        }
    assert_response :ok
    assert_template :edit
    assert flash[:error].present?
  end
end
